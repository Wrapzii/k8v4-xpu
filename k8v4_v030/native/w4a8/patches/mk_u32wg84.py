#!/usr/bin/env python3
"""oneDNN v3.14.2 catalog edit for B70 prefill: Xe2 int8 x int4 GEMM entry (sel F O S / T N N, unroll 64x16) with a
4x8 work-group instead of 2x8. Every W4A8 prefill shape picks this entry; the GEMM_KERNEL search (rice gemm_search.py)
measured wg 4x8 at 1.015x weighted, bit-identical. Changes the strategy string's wg and the driver's wg dims together.
usage: mk_wg48.py <oneDNN checkout>"""
import sys

p = sys.argv[1] + "/src/gpu/intel/gemm/jit/selector/db/kernel.db"
lines = open(p).read().split("\n")
key = '"at64+m128@32 am128+m64@32 aB wg 2x8 xaf st hi pt sr br sb128 sn grf256 cr0 sys tk"'
hits = [i for i, l in enumerate(lines) if key in l]
assert len(hits) == 1, ("entry", len(hits))
l = lines[hits[0]]
assert "{'G', \"gemm\", {\"F\", \"O\", \"S\"}, {\"T\", \"N\", \"N\"}}" in l, "selector"
assert l.count("{64, 16, 128}, {2, 8, 1}") == 1, "driver wg"
l = l.replace(key, key.replace("wg 2x8", "wg 8x4")).replace("{64, 16, 128}, {2, 8, 1}", "{32, 32, 128}, {8, 4, 1}")
lines[hits[0]] = l
open(p, "w").write("\n".join(lines))
print("entry", hits[0] + 1, "-> unroll 32x32 wg 8x4")
