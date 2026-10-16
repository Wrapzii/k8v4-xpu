"""Build the cascade source from the deployed lookahead source (sha256 982cad72...).

Usage: python3 patch_cpp.py BASE_SRC [OUT]
  BASE_SRC  the deployed lookahead xe2_kv source (sha256 982cad72...; this is
            k8v4_v030/native/xe2_kv_ops.cpp as it was immediately before the cascade commit)
  OUT       output path (default: xe2_kv_cascade.cpp in the current directory)
cascade_block.cpp is read from the directory containing this script.

Edits: (1) optional page_begin skip in the three per-request S1 kernels (nullptr = unchanged
behaviour), (2) append the cascade block, (3) register int8k_int4v_attn_batch_cascade,
(4) v2 gate: the q7 multi-request verify cascade is opt-in (XE2_KV_CASCADE_VERIFY=1).
The output is byte-identical to the committed k8v4_v030/native/xe2_kv_ops.cpp (sha256 6a4b7c8c...)."""
import hashlib, re, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent
if len(sys.argv) not in (2, 3):
    sys.exit(__doc__)
src = Path(sys.argv[1])
out = Path(sys.argv[2]) if len(sys.argv) == 3 else Path("xe2_kv_cascade.cpp")
assert hashlib.sha256(src.read_bytes()).hexdigest().startswith("982cad72"), "unexpected base source"
s = src.read_text()
def rep(a, b, n=1):
    global s
    c = s.count(a)
    assert c == n, (a[:80], c, n)
    s = s.replace(a, b)
# (1a) signatures
rep("""                                              const std::int32_t *visible_lens, int pages_per_block) {
  constexpr int GQA = Heads<HKV>::gqa;
""",
    """                                              const std::int32_t *visible_lens, int pages_per_block,
                                              const std::int32_t *page_begin = nullptr) {
  constexpr int GQA = Heads<HKV>::gqa;
""")
rep("""                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1) {
  constexpr int GQA = Heads<HKV>::gqa;
  if (q_len * GQA <= TM && s2_parallel_enabled() && s1_small_enabled()) {
    launch_int8k_int4v_s1_paged_small<HKV, PF16>(q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L,
                                                 n_splits, q_len, k_page_stride, v_page_stride,
                                                 sc_page_stride, visible_lens, pages_per_block);""",
    """                                        const std::int32_t *visible_lens = nullptr,
                                        int pages_per_block = 1,
                                        const std::int32_t *page_begin = nullptr) {
  constexpr int GQA = Heads<HKV>::gqa;
  if (q_len * GQA <= TM && s2_parallel_enabled() && s1_small_enabled()) {
    launch_int8k_int4v_s1_paged_small<HKV, PF16>(q, Q8, Qsc, K8, Ksc, V4, VS, VZ, bt, seq_lens, Part, M, L,
                                                 n_splits, q_len, k_page_stride, v_page_stride,
                                                 sc_page_stride, visible_lens, pages_per_block, page_begin);""", n=2)
# (1b) skip in kernels: after 'const int logical = prog - kv_head * n_splits;' in the 3 paged kernels
anchor = "          const int logical = prog - kv_head * n_splits;\n"
c = s.count(anchor)
assert c == 3, c
s = s.replace(anchor, anchor + "          // Cascade tail: pages below page_begin[0] were walked by the shared-prefix kernel.\n"
                              "          if (page_begin != nullptr && logical < page_begin[0]) return;  // work-group uniform\n")
# (2) cascade block before the namespace close
block = (HERE / "cascade_block.cpp").read_text()
rep("}  // namespace\n\nTORCH_LIBRARY(xe2_kv, m) {", block + "\n}  // namespace\n\nTORCH_LIBRARY(xe2_kv, m) {")
# (3) registration
rep("""      "int q_len, int pages_per_block) -> ()");
}""", """      "int q_len, int pages_per_block) -> ()");
  m.def(
      "int8k_int4v_attn_batch_cascade(Tensor q_fp16, Tensor(a!) q8, Tensor(b!) q_scale, "
      "Tensor k_cache, Tensor k_scale, Tensor v_cache, Tensor v_scale, Tensor v_zero, "
      "Tensor block_table, Tensor seq_lens, Tensor visible_lens, Tensor(c!) partials_ws, "
      "Tensor(d!) m_ws, Tensor(e!) l_ws, Tensor(f!) merged_ws, Tensor(g!) out, "
      "int q_len, int pages_per_block, Tensor(h!) casc_q8, Tensor(i!) casc_qsc, "
      "Tensor(j!) casc_plan, Tensor(k!) casc_part, Tensor(l!) casc_m, Tensor(m!) casc_l, "
      "int cap_pages, int slot_rows) -> ()");
}""")
rep("""  m.impl("int8k_int4v_attn_batch", &int8k_int4v_attn_batch);""",
    """  m.impl("int8k_int4v_attn_batch", &int8k_int4v_attn_batch);
  m.impl("int8k_int4v_attn_batch_cascade", &int8k_int4v_attn_batch_cascade);""")
# (4) v2: verify (q7) multi path measured 18% slower than serial, so it is opt-in only
rep("""  if (q_len == 7 && env_is_1("XE2_KV_COMPACT_SLM")) return 2;""",
    """  // Verify (q7) multi path measured 18% SLOWER than serial at 200K C4 (7.17 vs 6.06 ms,
  // window 2026-10-15), so it is opt-in only.
  if (q_len == 7 && env_is_1("XE2_KV_COMPACT_SLM") && env_is_1("XE2_KV_CASCADE_VERIFY")) return 2;""")
out.write_text(s)
digest = hashlib.sha256(out.read_bytes()).hexdigest()
print(out, digest)
if not digest.startswith("6a4b7c8c"):
    print("warning: output differs from the committed v2 source (6a4b7c8c...)", file=sys.stderr)
