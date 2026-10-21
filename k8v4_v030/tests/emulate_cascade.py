"""CPU emulator of the cascade schedule vs the serial attn_batch schedule.

It models what each kernel WRITES (slots, rows, padding publication, skipped pages) and
what S2 READS (page order, n_live, subgroup chunking, LSE merge order, float32), with
every workspace poisoned with NaN.  A live row's per-page partial is a deterministic
function of (request query, token, head, gqa row, physical page, visible count), which
is exactly what the row-local S1 arithmetic depends on.  If cascade indexing, region
layout, plan or write/read hazards are wrong, outputs differ bitwise or turn NaN.
This does NOT test DPAS arithmetic; the GPU test does (test_cascade_xpu.py)."""
import itertools, sys, hashlib
import numpy as np
BM = 64; TM = 8; GQA = 6; HKV = 2; HQ = HKV * GQA; BV = 4; CASC_MAX_B = 8
f32 = np.float32

def row_state(qid, tok, g, head, phys, nvis):
    if nvis <= 0:
        return f32(-np.inf), f32(0), np.zeros(BV, np.float16)
    h = hashlib.blake2b(repr((qid, tok, g, head, phys, nvis)).encode(), digest_size=16).digest()
    r = np.frombuffer(h, np.uint8).astype(np.float64) / 255.0
    m = f32(4 * r[0] - 2); l = f32(1 + 63 * r[1])
    v = (r[2:2 + BV] * 2 - 1).astype(np.float16)
    return m, l, v

class WS:
    def __init__(self, nslots, rows):
        self.M = np.full((nslots, rows), np.nan, f32)
        self.L = np.full((nslots, rows), np.nan, f32)
        self.A = np.full((nslots, rows, BV), np.nan, np.float16)

def phys_of(bt_row, logical, ratio):
    return bt_row[logical] if ratio <= 1 else bt_row[logical // ratio] * ratio + logical % ratio

def row_end(sl, tq, j):
    return sl - tq + j + 1

def s1_request(ws, slot_fn, rows_pub_ml, req, qid, bt_row, sl, tq, n_splits, ratio, page_begin=0,
               packed_rows=None, pad_rows_partial=None):
    """One per-request S1 launch (small / generic / reuse), skipping pages < page_begin."""
    live = tq * GQA
    live_cap = ((live + TM - 1) // TM) * TM
    for head in range(HKV):
        for p in range(n_splits):
            if p < page_begin: continue
            n_valid = max(0, min(BM, sl - p * BM))
            if n_valid <= 0: continue
            phys = phys_of(bt_row, p, ratio)
            slot = slot_fn(head, p)
            for row in range(rows_pub_ml):
                if row < live:
                    j, g = divmod(row, GQA)
                    nvis = max(0, min(n_valid, row_end(sl, tq, j) - p * BM))
                    m, l, v = row_state(qid, j, g, head, phys, nvis)
                else:
                    m, l, v = f32(-np.inf), f32(0), np.zeros(BV, np.float16)
                ws.M[slot, row] = m; ws.L[slot, row] = l
                if row < live_cap: ws.A[slot, row] = v

def s2_request(Mfn, out_rows, sl, tq, n_splits, nsg):
    n_live = max(1, min(n_splits, (sl + BM - 1) // BM))
    chunk = (n_live + nsg - 1) // nsg
    res = {}
    for j in range(tq):
        for h in range(HQ):
            head, g = divmod(h, GQA); row = j * GQA + g
            states = []
            for sg in range(nsg):
                s0 = sg * chunk; s1 = min(s0 + chunk, n_live)
                gm = f32(-np.inf); ls = f32(0); ov = np.zeros(BV, f32)
                for s in range(s0, s1):
                    mv, lv, vv = Mfn(head, s, row)
                    vv = vv.astype(f32)
                    ngm = max(gm, mv) if not (np.isnan(gm) or np.isnan(mv)) else f32(np.nan)
                    alpha = f32(0) if gm == -np.inf else f32(np.exp(f32(gm - ngm)))
                    w = f32(0) if (mv == -np.inf or ngm == -np.inf) else f32(np.exp(f32(mv - ngm)))
                    wl = f32(w * lv); ls = f32(ls * alpha + wl); ov = (ov * alpha + wl * vv).astype(f32); gm = ngm
                states.append((gm, ls, ov))
            gm = f32(-np.inf); ls = f32(0); ov = np.zeros(BV, f32)
            for (mv, lv, vv) in states:
                ngm = max(gm, mv) if not (np.isnan(gm) or np.isnan(mv)) else f32(np.nan)
                alpha = f32(0) if gm == -np.inf else f32(np.exp(f32(gm - ngm)))
                w = f32(0) if (mv == -np.inf or ngm == -np.inf) else f32(np.exp(f32(mv - ngm)))
                ls = f32(ls * alpha + w * lv); ov = (ov * alpha + w * vv).astype(f32); gm = ngm
            inv = f32(1) / max(ls, f32(1e-20)) if not np.isnan(ls) else f32(np.nan)
            res[(j, h)] = (ov * inv).astype(np.float16)
    return res

def nsg_for(tq): return 32 if tq == 1 else 8   # production XE2_KV_S2_NSG_DRAFT / _VERIFY

def serial(bt, sls, qids, tq, ratio):
    B, n_table = bt.shape; n_splits = n_table * ratio
    ws = WS(HKV * n_splits, BM); outs = []
    for i in range(B):
        rows_ml = TM if tq * GQA <= TM else BM
        s1_request(ws, lambda h, p: h * n_splits + p, rows_ml, i, qids[i], bt[i], sls[i], tq, n_splits, ratio)
        outs.append(s2_request(lambda h, s, r: (ws.M[h * n_splits + s, r], ws.L[h * n_splits + s, r],
                                                ws.A[h * n_splits + s, r]), None, sls[i], tq, n_splits, nsg_for(tq)))
    return outs

def plan_fn(bt, sls, tq, ratio, cap):
    B, n_table = bt.shape; n_splits = n_table * ratio
    full = []
    for i in range(B):
        qe = min([sls[i]] + [row_end(sls[i], tq, j) for j in range(tq)])
        full.append(qe // BM if qe >= BM else 0)
    parts = [i for i in range(B) if full[i] > 0]
    if not parts: return 0, 0, [0] * B
    leader = parts[0]; first_mis = n_table
    for e in range(n_table):
        if any(bt[i][e] != bt[leader][e] for i in parts if i != leader): first_mis = e; break
    S = min(first_mis * ratio, min(full[i] for i in parts), cap, n_splits)
    if len(parts) < 2: S = 0
    return S, leader, [S if full[i] > 0 else 0 for i in range(B)]

def cascade(bt, sls, qids, tq, ratio, cap, slot_rows=48):
    B, n_table = bt.shape; n_splits = n_table * ratio
    live = tq * GQA
    mode = 1 if (live <= TM and TM + B * live <= BM) else (2 if tq == 7 else 0)
    assert mode in (1, 2)
    ws = WS(HKV * n_splits, BM)
    xs = WS(max(1, (B - 1) * HKV * cap), slot_rows)
    S, leader, pb = plan_fn(bt, sls, tq, ratio, n_splits if mode == 1 else cap)
    lead_bt = bt[leader]
    # shared S1 (n_valid = BM, no mask; plan guarantees full visibility for participants)
    for head in range(HKV):
        for p in range(S):
            phys = phys_of(lead_bt, p, ratio)
            if mode == 1:
                slot = head * n_splits + p
                for row in range(BM):
                    k = row - TM
                    if 0 <= k < B * live:
                        i, rr = divmod(k, live); j, g = divmod(rr, GQA)
                        m, l, v = row_state(qids[i], j, g, head, phys, BM)
                    else:
                        m, l, v = f32(-np.inf), f32(0), np.zeros(BV, np.float16)
                    ws.M[slot, row] = m; ws.L[slot, row] = l
                    if TM <= row < TM + ((B * live + TM - 1) // TM) * TM: ws.A[slot, row] = v
            else:
                live_cap = ((live + TM - 1) // TM) * TM
                for r in range(B):
                    if pb[r] == 0: continue
                    for row in range(BM if r == 0 else slot_rows):
                        if row < live:
                            j, g = divmod(row, GQA); m, l, v = row_state(qids[r], j, g, head, phys, BM)
                        else:
                            m, l, v = f32(-np.inf), f32(0), np.zeros(BV, np.float16)
                        if r == 0:
                            slot = head * n_splits + p; W = ws
                        else:
                            slot = ((r - 1) * HKV + head) * cap + p; W = xs
                        W.M[slot, row] = m; W.L[slot, row] = l
                        if row < live_cap: W.A[slot, row] = v
    outs = []
    for i in range(B):
        rows_ml = TM if live <= TM else BM
        s1_request(ws, lambda h, p: h * n_splits + p, rows_ml, i, qids[i], bt[i], sls[i], tq, n_splits, ratio,
                   page_begin=pb[i])
        Si = pb[i]
        if mode == 1 or i == 0:
            off = TM + i * live if mode == 1 else 0
            fn = lambda h, s, r, Si=Si, off=off: ((ws.M[h * n_splits + s, r + off], ws.L[h * n_splits + s, r + off],
                                                   ws.A[h * n_splits + s, r + off]) if s < Si else
                                                  (ws.M[h * n_splits + s, r], ws.L[h * n_splits + s, r],
                                                   ws.A[h * n_splits + s, r]))
        else:
            base = (i - 1) * HKV * cap
            fn = lambda h, s, r, Si=Si, base=base: ((xs.M[base + h * cap + s, r], xs.L[base + h * cap + s, r],
                                                     xs.A[base + h * cap + s, r]) if s < Si else
                                                    (ws.M[h * n_splits + s, r], ws.L[h * n_splits + s, r],
                                                     ws.A[h * n_splits + s, r]))
        outs.append(s2_request(fn, None, sls[i], tq, n_splits, nsg_for(tq)))
    return outs, S

def build(B, n_table, ratio, shared_blocks, sls, seed, mismatch_at=None):
    rng = np.random.default_rng(seed); nxt = 1000; bt = np.zeros((B, n_table), np.int64)
    pre = list(rng.permutation(400)[:shared_blocks] + 1)
    for i in range(B):
        row = list(pre)
        while len(row) < n_table: row.append(nxt); nxt += 1
        bt[i] = row
    if mismatch_at is not None: bt[2][mismatch_at] = 7777
    return bt

def run():
    cases = []
    for tq, ratio in itertools.product((1, 7), (1, 2)):
        nt = 24 // ratio
        cases += [
            ("all-share", tq, ratio, build(4, nt, ratio, nt // 2, None, 1), [nt * ratio * BM - 5, 900, 1001, 777], 64),
            ("partial", tq, ratio, build(4, nt, ratio, nt // 3, None, 2, mismatch_at=2), [1500, 1400, 1300, 1450], 64),
            ("noshare", tq, ratio, build(4, nt, ratio, 0, None, 3), [1300, 1200, 1100, 1000], 64),
            ("short+dummy", tq, ratio, build(4, nt, ratio, nt // 2, None, 4), [1200, 30, 1100, 0], 64),
            ("cap", tq, ratio, build(4, nt, ratio, nt - 2, None, 5), [nt * ratio * BM - 1, nt * ratio * BM - 70, 1500, 1460], 5),
            ("shorter-than-prefix", tq, ratio, build(3, nt, ratio, nt - 1, None, 6), [500, 1400, 1450], 64),
            ("short-first", tq, ratio, build(4, nt, ratio, nt // 2, None, 8), [30, 1200, 1100, 1000], 64),
            ("B2", tq, ratio, build(2, nt, ratio, nt // 2, None, 7), [1300, 1350], 64),
        ]
    bad = 0
    for name, tq, ratio, bt, sls, cap in cases:
        B = bt.shape[0]; qids = [100 + i for i in range(B)]
        ser = serial(bt, sls, qids, tq, ratio)
        cas, S = cascade(bt, sls, qids, tq, ratio, cap)
        nreal = ndiff = nnan = 0
        for i in range(B):
            if sls[i] < 1: continue  # dummy rows read stale workspace in BOTH schedules
            for k in ser[i]:
                a, b = ser[i][k], cas[i][k]; nreal += 1
                if np.isnan(b).any() or np.isnan(a).any(): nnan += 1
                if a.tobytes() != b.tobytes(): ndiff += 1
        ok = ndiff == 0 and nnan == 0
        bad += not ok
        print(f"{name:20s} q{tq} ratio{ratio} B{B} S={S:3d} rows={nreal:5d} bitdiff={ndiff} nan={nnan} {'OK' if ok else 'FAIL'}")
    print("ALL OK" if bad == 0 else f"{bad} FAILED")
    return bad

if __name__ == "__main__":
    sys.exit(run())
