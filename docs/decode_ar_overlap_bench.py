"""#4 redo: decode-sized, graph-captured TP all-reduce latency and overlap (2 ranks).

EXCLUSIVE GPU WINDOW ONLY (production stopped).  Run inside the production image:
  torchrun --nproc-per-node 2 decode_ar_overlap_bench.py --hidden 5120 --tokens 4,28 --out ar.json
with the production CCL env (CCL_SYCL_ALLREDUCE_LL=twoshots CCL_SYCL_COPY_ENGINE=1) and
again with each variant you want to compare (e.g. CCL_SYCL_COPY_ENGINE=0, LL unset).

What the 2026-10-14 attempt did not measure, and this does:
  * message sizes of decode (B*T x hidden fp16: 4x5120 = 40 KB draft, 28x5120 = 287 KB verify),
    not the 43 MB prefill message;
  * the graph-replayed cost (decode runs FULL_DECODE_ONLY graphs), separating
    host launch from device time: eager per-call, graph per-call (N calls in one replay);
  * real overlap: all-reduce on a side stream with events inside ONE captured graph,
    against an INDEPENDENT GEMM, in both issue orders, vs the serial graph;
  * a dependent chain (GEMM -> AR -> GEMM) like the model, to bound what overlap can buy.
"""
from __future__ import annotations
import argparse, json, os, time
import torch, torch.distributed as dist


def timeit(fn, iters):
    torch.xpu.synchronize(); dist.barrier()
    t0 = time.perf_counter()
    for _ in range(iters): fn()
    torch.xpu.synchronize()
    return (time.perf_counter() - t0) * 1e3 / iters


def graph_of(fn):
    g = torch.xpu.XPUGraph()
    s = torch.xpu.Stream()
    s.wait_stream(torch.xpu.current_stream())
    with torch.xpu.stream(s):
        for _ in range(3): fn()
    torch.xpu.current_stream().wait_stream(s); torch.xpu.synchronize()
    with torch.xpu.graph(g):
        fn()
    return g


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--hidden", type=int, default=5120)          # confirmed: config.json hidden_size 5120
    ap.add_argument("--inter", type=int, default=17408 // 2)     # confirmed: config.json intermediate_size 17408 / TP2
    ap.add_argument("--tokens", default="4,28")
    ap.add_argument("--chain", type=int, default=32)             # ops per replay (amortise launch)
    ap.add_argument("--iters", type=int, default=50)
    ap.add_argument("--out")
    a = ap.parse_args()
    dist.init_process_group("xccl")
    rank = dist.get_rank(); torch.xpu.set_device(rank)
    dev = torch.device("xpu", rank)
    res = {"env": {k: v for k, v in os.environ.items() if k.startswith("CCL_")}, "cases": {}}
    for T in [int(x) for x in a.tokens.split(",")]:
        x = torch.randn(T, a.hidden, device=dev, dtype=torch.float16)
        w1 = torch.randn(a.hidden, a.inter, device=dev, dtype=torch.float16) * 0.01
        w2 = torch.randn(a.inter, a.hidden, device=dev, dtype=torch.float16) * 0.01
        h = torch.empty(T, a.inter, device=dev, dtype=torch.float16)
        y = torch.empty(T, a.hidden, device=dev, dtype=torch.float16)
        side = torch.xpu.Stream(); ev0 = torch.xpu.Event(); ev1 = torch.xpu.Event()
        buf = x.clone()
        def ar():  # what XpuCommunicator.all_reduce does: clone + all_reduce
            o = buf.clone(); dist.all_reduce(o); return o
        def gemm():
            torch.matmul(x, w1, out=h); torch.matmul(h, w2, out=y)
        def chain(fn):
            return lambda: [fn() for _ in range(a.chain)]
        def serial():
            for _ in range(a.chain):
                ar(); gemm()
        def overlap(ar_first):
            def f():
                for _ in range(a.chain):
                    ev0.record(); side.wait_event(ev0)
                    if ar_first:
                        with torch.xpu.stream(side): ar()
                        gemm()
                    else:
                        gemm()
                        with torch.xpu.stream(side): ar()
                    ev1.record(side); torch.xpu.current_stream().wait_event(ev1)
            return f
        def dependent():
            for _ in range(a.chain):
                gemm(); buf.copy_(y); ar()
        r = {"bytes": T * a.hidden * 2}
        r["eager_ar_ms"] = timeit(ar, a.iters)
        r["eager_gemm_ms"] = timeit(gemm, a.iters)
        for name, fn in [("ar", chain(ar)), ("gemm", chain(gemm)), ("serial", serial),
                         ("overlap_ar_first", overlap(True)), ("overlap_gemm_first", overlap(False)),
                         ("dependent", dependent)]:
            try:
                g = graph_of(fn)
                r[f"graph_{name}_ms_per_op"] = timeit(g.replay, a.iters) / a.chain
            except Exception as e:
                r[f"graph_{name}_ms_per_op"] = f"failed: {type(e).__name__}: {e}"
        res["cases"][f"T{T}"] = r
        if rank == 0: print(T, json.dumps(r), flush=True)
    if rank == 0 and a.out:
        open(a.out, "w").write(json.dumps(res, indent=1))
    dist.destroy_process_group()


if __name__ == "__main__":
    main()
