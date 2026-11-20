FROM vllm/vllm-openai-xpu:v0.34.0@sha256:cb55d8cffeb1851c552c4b002a5e8be21daa99a51a678d53c57f271e7c16b3f0
COPY k8v4_v030 /opt/k8v4/k8v4_v030
COPY libxe2_kv.so /opt/k8v4/libxe2_kv.so
COPY libk8v4_sdpa.so /opt/k8v4/libk8v4_sdpa.so
COPY libdnnl.so.3 /opt/k8v4/libdnnl.so.3
ENV PYTHONPATH=/opt/k8v4 \
    XE2_KV_LIB=/opt/k8v4/libxe2_kv.so \
    K8V4_SDPA_LIB=/opt/k8v4/libk8v4_sdpa.so \
    K8V4_PREFILL=onednn \
    K8V4_PREFILL_GEMM=w4a8 \
    VLLM_CACHE_ROOT=/root/.cache/vllm/w4a8-wired-v1 \
    XE2_KV_S2_NSG=32
RUN python3 -m py_compile \
      /opt/k8v4/k8v4_v030/backend.py \
      /opt/k8v4/k8v4_v030/dequant.py \
      /opt/k8v4/k8v4_v030/onednn_prefill.py \
      /opt/k8v4/k8v4_v030/w4a8_prefill.py \
      /opt/k8v4/k8v4_v030/layout.py \
    && python3 /opt/k8v4/k8v4_v030/patch_installed_vllm.py
