# Swift baked checkpoint publication

The model card and retained licenses are in `huggingface/swift-baked/`.
The public source is UkisAI's Swift AutoRound checkpoint, pinned to
`278de52d4252d0b7c0ea01833d1403cd386c65ef`. Launch80's baked Qwen release
and B65 tooling are credited as approach/tooling references; no Launch80
weights or Hessians were transplanted.

## Prepare a separate release directory

```bash
sudo python3 tools/prepare_swift_hf_release.py \
  --src /srv/models/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
  --dst /srv/models/hf-release/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
  --repo "$PWD"
```

The destination must not exist. Unchanged shards use hardlinks to avoid
duplicating roughly 16 GB; do not edit them in place. Changed shards receive
publication notices in their headers, with identical tensor payloads.
The script records payload hashes, verifies all 2,426 index entries, retains
licenses, includes raw benchmark records, removes superseded upload claims,
replaces local source paths, and applies the low-default chat template to both
the standalone template and tokenizer configuration. No recalibration or
performance testing is performed by packaging.

The assembled release has 35 files before its inventory manifest, totaling
18,344,039,216 bytes. It includes the dense on-disk embedding and separate
INT8 embedding side file. Resident INT8 savings require the custom loader.

## Publish

Authenticate the supported Hugging Face CLI with a write token, then upload:

```bash
hf repo create Wrapzii/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 --repo-type model
hf upload Wrapzii/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 \
  /srv/models/hf-release/Swift-1.5-Qwen3.8-27b-GPTQ-Int4-baked-v1-embed-int8 .
```

Keep credentials out of the repository, model card, command history and logs.
Verify the public file list and model card after uploading. A temporary upload
token can be revoked once the upload is verified.

## Reported measurements

The card reports cached coding-probe decode of 136.5/134.0/77.8/60.8 tok/s
at approximately 2K/8K/128K/200K, with thinking disabled and observed
concurrency one. The large-context C1 run followed the user pausing room
traffic. Earlier unbaked measurements had concurrent traffic, so their
before/after comparison is not a controlled quantization-only speedup.

Per-GPU model-weight memory fell from 9.23 to 7.47 GiB. Shared KV capacity
increased from 749,485 to 869,121 tokens. The card does not claim four
simultaneous full 262,144-token windows or a new Swift 261K prefill test.
