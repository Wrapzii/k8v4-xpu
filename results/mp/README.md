# Multi-page / team verifier experiments (2026-11-04) ? bench-only, nothing promoted
Sources: kstudy/src/xe2_kv_ops_{mp,mp2,mp3,mp4,team}.cpp (from c4 xe2_kv_ops_c4.cpp). Libs (JIT, DPC++ 2026.0) on /mnt/hdd-500gb/.../perf-attnprof-20261104/mp-libs; hashes in sha256-all.txt.
Selectors: XE2_KV_VERIFY_PAGES=P, XE2_KV_VERIFY_MP_IMPL=2 (global fp32 acc) | 3 (SLM P-buffer) | 4 (register P) | 5 (team-per-page, G=P).
Correctness vs fp32: mpcheck-{mp,mp2,mp3,mp4}.jsonl (all pass; dP1 <= 1.5e-5). Team: maxabs vs P=1 3.8e-6 at 200K (fast/f1.jsonl).
Timing 200K b1 verifier (measured, vLLM-idle gated): P=1 1580 us (=prod 1582); mp3p2 1689-1714; mp4p2 1727; mp4p4 1767; teamG2 2208; teamG4 3076. All slower: S2 drops, S1 grows more.
Noisy/contaminated runs kept in noisy-2219Z/, s1d-contaminated-vllm-busy/, interrupted-2107Z/.
