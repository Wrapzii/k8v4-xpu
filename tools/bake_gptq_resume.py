#!/usr/bin/env python3
# Adapted from launch80/B65 (MIT); see B65-LICENSE beside this file.
"""Resume the bake from hessians.pt: GPTQ + pack, reading the dense source tensors
straight from the checkpoint shards. No vLLM. Hessians are keyed by the vLLM module
that owned the INPUT; each maps to one or more HF tensors that share that input."""
import argparse, json, os, sys, time, glob, torch
from safetensors import safe_open
from safetensors.torch import save_file

ap = argparse.ArgumentParser()
ap.add_argument("--src", required=True); ap.add_argument("--out", required=True)
ap.add_argument("--damp", type=float, default=0.01)
ap.add_argument("--column-chunk", type=int, default=8192)
a = ap.parse_args()
G, DEV = 128, "xpu"

MAP = {  # vLLM input-owner module -> HF tensors sharing that input
    "language_model.lm_head":            ["lm_head.weight"],
    "model.fc":                          ["mtp.fc.weight"],
    "model.layers.0.self_attn.qkv_proj": ["mtp.layers.0.self_attn.q_proj.weight",
                                          "mtp.layers.0.self_attn.k_proj.weight",
                                          "mtp.layers.0.self_attn.v_proj.weight"],
    "model.layers.0.self_attn.o_proj":   ["mtp.layers.0.self_attn.o_proj.weight"],
    "model.layers.0.mlp.gate_up_proj":   ["mtp.layers.0.mlp.gate_proj.weight",
                                          "mtp.layers.0.mlp.up_proj.weight"],
    "model.layers.0.mlp.down_proj":      ["mtp.layers.0.mlp.down_proj.weight"],
}
ck = torch.load(os.path.join(a.out, "hessians.pt"), map_location="cpu")
H, Xe, nrows = ck["H"], ck["Xe"], ck["nrows"]
assert all(v.dtype == torch.float32 for v in H.values()), 'Calibration Hessians must be float32'
print('HESSIANS', {k: (tuple(v.shape), str(v.dtype)) for k, v in H.items()}, flush=True)
missing = [k for k in MAP if k not in H]
assert not missing, f"hessians.pt lacks {missing}"
idx = json.load(open(os.path.join(a.src, "model.safetensors.index.json")))["weight_map"]

def load_hf(name):
    with safe_open(os.path.join(a.src, idx[name]), framework="pt") as f:
        return f.get_tensor(name)

@torch.no_grad()
def inv_hessian(Hm, K):
    Hm = Hm.to(DEV).float(); d = torch.diag(Hm); Hm[d == 0, d == 0] = 1.0
    Hm += torch.eye(K, device=DEV) * (a.damp * d.mean())
    try:
        return torch.linalg.cholesky(torch.cholesky_inverse(torch.linalg.cholesky(Hm)), upper=True)
    except Exception:
        Hc = Hm.double().cpu()
        return torch.linalg.cholesky(torch.cholesky_inverse(torch.linalg.cholesky(Hc)), upper=True).float().to(DEV)

@torch.no_grad()
def gptq_int4(W, Hinv):
    K, N = W.shape
    Wc = W.clone(); codes = torch.zeros((K, N), dtype=torch.uint8, device=W.device)
    scales = torch.zeros((K // G, N), dtype=torch.float32, device=W.device)
    for i0 in range(0, K, G):
        i1 = i0 + G; Wb = Wc[i0:i1].clone(); Eb = torch.zeros_like(Wb); Hb = Hinv[i0:i1, i0:i1]
        s = Wc[i0:i1].abs().amax(0).clamp_min(1e-9) / 7.0
        scales[i0 // G] = s
        for j in range(G):
            col = Wb[j]; qi = torch.clamp(torch.round(col / s), -8, 7)
            codes[i0 + j] = (qi + 8).to(torch.uint8)
            err = (col - qi * s) / Hb[j, j]
            Wb[j:] -= torch.outer(Hb[j, j:], err); Eb[j] = err
        if i1 < K: Wc[i1:] -= Hinv[i0:i1, i1:].t() @ Eb
    return codes, scales

def pack_gptq(codes, scales):
    K, N = codes.shape
    c = codes.to(torch.int32).reshape(K // 8, 8, N)
    sh = (torch.arange(8, device=c.device, dtype=torch.int32) * 4).view(1, 8, 1)
    qweight = (c << sh).sum(1, dtype=torch.int64).to(torch.int32)
    qzeros = torch.full((K // G, N // 8), 0x77777777, dtype=torch.int32, device=c.device)
    g_idx = torch.arange(K, device=c.device, dtype=torch.int32) // G
    return {"qweight": qweight.contiguous(), "scales": scales.half().contiguous(),
            "qzeros": qzeros, "g_idx": g_idx}

def unpack_check(t, codes):
    qw = t["qweight"]; K8, N = qw.shape
    sh = (torch.arange(8, device=qw.device, dtype=torch.int32) * 4).view(1, 8, 1)
    return torch.equal(((qw.unsqueeze(1) >> sh) & 0xF).reshape(K8 * 8, N).to(torch.uint8), codes)

out, manifest, t0 = {}, {}, time.time()
with torch.no_grad():
    for mname, hf_names in MAP.items():
        K = H[mname].shape[0]
        Hi = inv_hessian(H[mname], K); del H[mname]
        xe = torch.cat(Xe[mname], 0)[:1024].to(DEV).float() if Xe.get(mname) else None
        for hf in hf_names:
            Wt = load_hf(hf).to(DEV).float().t().contiguous()        # [K, N]
            assert Wt.shape[0] == K, f"{hf}: K={Wt.shape[0]} but Hessian is {K}"
            CH = a.column_chunk
            parts = []
            for c0 in range(0, Wt.shape[1], CH):
                parts.append(gptq_int4(Wt[:, c0:c0 + CH].contiguous(), Hi))
                print('GPTQ_COLUMNS', hf, min(c0+CH, Wt.shape[1]), '/', Wt.shape[1], flush=True)
            codes = torch.cat([p[0] for p in parts], 1); s = torch.cat([p[1] for p in parts], 1); del parts
            deq = (codes.float() - 8.0) * s.half().float().repeat_interleave(G, dim=0)
            werr = ((deq - Wt).norm() / Wt.norm()).item()
            oerr = rerr = float("nan")
            if xe is not None:
                ref = xe @ Wt; oerr = (((xe @ deq) - ref).norm() / ref.norm()).item()
                s_rtn = Wt.reshape(K // G, G, -1).abs().amax(1).clamp_min(1e-9) / 7.0
                rtn = (torch.clamp(torch.round(Wt.reshape(K // G, G, -1) / s_rtn.unsqueeze(1)), -8, 7)
                       * s_rtn.unsqueeze(1)).reshape(K, -1)
                rerr = (((xe @ rtn) - ref).norm() / ref.norm()).item(); del rtn, ref
            t = pack_gptq(codes, s); assert unpack_check(t, codes), f"{hf}: pack/unpack mismatch"
            base = hf[:-len(".weight")]
            for kk, v in t.items(): out[f"{base}.{kk}"] = v.cpu()
            manifest[hf] = dict(K=K, N=int(Wt.shape[1]), rows=int(nrows.get(mname, 0)),
                                out_err_gptq=oerr, out_err_rtn_today=rerr, weight_err=werr)
            print(f"  {hf:<44s} K={K:<6d} N={Wt.shape[1]:<7d} rows={nrows.get(mname,0):<6d} "
                  f"OUT gptq {oerr*100:5.2f}%  (rtn today {rerr*100:5.2f}%)   {time.time()-t0:5.0f}s", flush=True)
            del Wt, codes, s, deq, t
        del Hi, xe; torch.xpu.empty_cache()

save_file(out, os.path.join(a.out, "bake-int4.safetensors"), metadata={"format": "pt"})
json.dump(manifest, open(os.path.join(a.out, "bake-manifest.json"), "w"), indent=1)
print(f"\nwrote {len(out)} tensors -> {a.out}/bake-int4.safetensors", flush=True)
