"""Correctness check for multi-page verifier splits (XE2_KV_VERIFY_PAGES).
Runs the loaded lib at VPP=1/2/4 (pf16=1) and pf16=0, compares to an fp32
reference on dequantized KV, and dumps outputs for cross-lib comparison."""
import argparse, json, os, torch
from k8v4_v030.cache_views import bind_regions
from k8v4_v030.layout import PAGE, PageLayout
from k8v4_v030.ops_api import ops
from k8v4_v030.plan import workspace_programs
from k8v4_v030.scratch import Scratch
from k8v4_v030.dequant import gather_dequant_range, eager_gqa_attention

ap = argparse.ArgumentParser()
ap.add_argument("--ctx", default="1000,4160,32868,131072,204800")
ap.add_argument("--qlen", default="1,7"); ap.add_argument("--batch", default="1,2")
ap.add_argument("--tag", required=True); ap.add_argument("--ref", type=int, default=1)
a = ap.parse_args()
dev = torch.device("xpu:0"); print("mem_get_info", torch.xpu.mem_get_info(0), flush=True); L = PageLayout(2); torch.manual_seed(1234)
ctxs = [int(x) for x in a.ctx.split(",")]
pages = (max(ctxs) + PAGE - 1) // PAGE
raw = torch.randint(-127, 127, (pages * L.page_bytes,), dtype=torch.int8, device=dev)
v = bind_regions(raw, L)
v["k_scale"].uniform_(0.005, 0.02); v["v_scale"].uniform_(0.005, 0.02); v["v_zero"].fill_(8.0)
s = Scratch(dev, L, nprog_max=workspace_programs(pages, 1, L), max_store_tokens=1, max_out_tokens=4 * 7)
dump = {}; out = open("/out/mpcheck-%s.jsonl" % a.tag, "w")
HQ = L.hq
os.environ["XE2_KV_TIME_SPLITS"] = "1"  # stderr line per call reports effective vpp
for ctx in ctxs:
    np_ = (ctx + PAGE - 1) // PAGE
    for b in [int(x) for x in a.batch.split(",")]:
        bt = torch.arange(np_, dtype=torch.int32, device=dev).repeat(b, 1).contiguous()
        sl = torch.full((b,), ctx, dtype=torch.int32, device=dev)
        part, m, l, merged = s.workspace(workspace_programs(np_, 1, L))
        refk = None
        for ql in [int(x) for x in a.qlen.split(",")]:
            q, o = s.attention_pair(b * ql); g = torch.Generator(device=dev).manual_seed(7 + ql)
            q.copy_(torch.randn(q.shape, generator=g, device=dev, dtype=torch.float32).half())
            res = {}
            for name, pf, vpp in [("pf32", "0", "1"), ("p1", "1", "1"), ("p2", "1", "2"), ("p4", "1", "4"), ("p8", "1", "8")]:
                os.environ["XE2_KV_PARTIAL_FP16"] = pf; os.environ["XE2_KV_VERIFY_PAGES"] = vpp
                part.fill_(float("nan")); m.fill_(float("nan")); l.fill_(float("nan"))  # poison workspace
                ops().int8k_int4v_attn_batch(q, s.q8, s.q_scale, v["k"], v["k_scale"], v["v"],
                    v["v_scale"], v["v_zero"], bt, sl, s.visible, part, m, l, merged, o, ql, 1)
                torch.xpu.synchronize(); res[name] = o.float().clone().cpu()
            r = {"ctx": ctx, "batch": b, "q_len": ql}
            for k in res:
                r["finite_" + k] = bool(torch.isfinite(res[k]).all())
                if k != "p1": r["maxabs_%s_vs_p1" % k] = float((res[k] - res["p1"]).abs().max())
            if a.ref:
                if refk is None:
                    ks, vs = [], []
                    for st0 in range(0, ctx, 32768):  # chunked: keep GPU footprint small
                        kk, vv = gather_dequant_range(v, bt[0], st0, min(ctx, st0 + 32768), 1, torch.float32)
                        ks.append(kk.cpu()); vs.append(vv.cpu()); del kk, vv
                    refk = (torch.cat(ks), torch.cat(vs)); del ks, vs
                kk, vv = refk
                qf = q.float().cpu().view(b, ql, HQ, -1)
                ref = torch.stack([eager_gqa_attention(qf[i], kk, vv, 1.0 / 16.0) for i in range(b)]).reshape(b * ql, -1).cpu()
                for k in res:
                    d = (res[k].reshape(b * ql, -1) - ref).abs()
                    r["maxabs_%s_vs_fp32" % k] = float(d.max())
                    r["relrms_%s_vs_fp32" % k] = float(d.pow(2).mean().sqrt() / ref.pow(2).mean().sqrt())
            dump["%d_%d_%d" % (ctx, b, ql)] = res
            out.write(json.dumps(r) + "\n"); out.flush(); print(json.dumps(r), flush=True)
torch.save(dump, "/out/mpcheck-%s.pt" % a.tag)
