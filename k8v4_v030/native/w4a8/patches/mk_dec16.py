#!/usr/bin/env python3
"""oneDNN v3.14.2 catalog edit for B70 decode: Xe2 fp16 x int4 GEMM (sel F H S / T N N) at 9-16 batch rows.
Stock picks a 4-slice K-parallel kernel with 32-wide activation loads (and, for 5,120 outputs, a 2-slice one); both
run 9-11% slower per call than the entry used up to 8 rows. This gives 9-16 rows that entry's strategy (8-slice
K-parallel, wg 2x1x8, no prefetch) with 64-wide activation loads and a 16-row unroll: the per-call time of the 8-row
kernel (rice g16c.py: weighted over the five decode shapes -9% at 10, 12 and 16 rows). The arithmetic is the same
fp16 x s4 products accumulated in fp32; the K-slice summation order becomes the one the <=8-row entry already uses.
The 5,120-output special entry keeps 17-24 rows. usage: mk_dec16.py <oneDNN checkout>"""
import sys

p = sys.argv[1] + "/src/gpu/intel/gemm/jit/selector/db/kernel.db"
lines = open(p).read().split("\n")
SEL = "{{'G', \"gemm\", {\"F\", \"H\", \"S\"}, {\"T\", \"N\", \"N\"}}, "
D = '"at32 am128 aB wg 2x1x8 ikr xaf st vav hi pt sr br sb128 bk0 bm0 nmk sys tk"'
A = '"at32+m32@32 am32+m128@80 aB wg 8x1x4 ikr xaf vav pt sr br sb128 bk0 sm sn bm0 nmk sys wx2"'
B = '"at64+m128@96 am32+m32@160 aB wg 4x2x2 ikr xaf st vav bo pt sr br sb64 bk0 sm sn bm0 sys"'


def one(key):
    h = [i for i, l in enumerate(lines) if l.startswith(SEL) and key in l]
    assert len(h) == 1, (key, len(h))
    return h[0]


d, a, b = one(D), one(A), one(B)
RA = "{-1, -1, {-1, -1, -1}, {-1, -1, -1}, {-1, 9, -1}, {-1, 16, -1}, {16, 16, 1}, \"ABI\"}, "
RD = "{-1, -1, {-1, -1, -1}, {-1, 8, -1}, {-1, -1, -1}, {-1, 8, -1}, {16, 16, 1}, \"IAB\"}, "
assert lines[a].startswith(SEL + RA + A), "9-16 entry restrictions"
assert lines[d].startswith(SEL + RD + D), "<=8 entry restrictions"
tail = lines[d][len(SEL + RD + D):]
assert tail.count("{16, 8, 128}, {2, 1, 8}") == 1, "<=8 entry driver"
lines[a] = SEL + RA + D.replace("am128", "am64") + tail.replace("{16, 8, 128}, {2, 1, 8}", "{16, 16, 128}, {2, 1, 8}")
rb = "{5120, 9, 1280}, {5120, 24, -1}"
assert lines[b].count(rb) == 1, "5120 entry rows"
lines[b] = lines[b].replace(rb, "{5120, 17, 1280}, {5120, 24, -1}")
open(p, "w").write("\n".join(lines))
print("entry", a + 1, "-> <=8-row strategy, am64, unroll 16x16; entry", b + 1, "-> 17-24 rows only")
