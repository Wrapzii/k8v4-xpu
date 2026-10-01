# October 1 VM memory incident and recovery

The AI VM became unresponsive across SSH, the room, and the model service. Proxmox remained reachable and reported the VM running. The guest agent did not respond, and the serial console showed repeated `Write-error on swap-device (251:0:...)` messages. That device is the guest's zram swap device. This evidence points to guest memory/swap failure; it is not evidence of a quantized-weight quality problem or a GPU CAT fault.

The live configuration after recovery exposed 14 GiB of logical zram swap, with a 3 GiB cap on its physical compressed storage and priority 100. Its helper incorrectly assumed rejected writes at the physical cap would automatically fall through to disk swap. A physical storage cap can reject writes while the swap allocator still sees free logical slots. Repeated swap-write failures and reclaim stalls are consistent with that mechanism. The exact pre-reset zram occupancy was unavailable, so reaching the cap is the leading explanation rather than a captured measurement.

With user approval, a graceful Proxmox reboot was attempted and timed out. A forced VM reset restored access. The completed Swift checkpoint and synchronized serving image were retained.

## Persistent changes

- Logical zram capacity is now 4 GiB, with `mem_limit=0`. Its finite logical size bounds storage instead of rejecting writes at a lower physical cap.
- Existing 16 GiB and 4 GiB disk swap files remain active as overflow. No disk was formatted or replaced.
- `vm.swappiness` is now 60 instead of 180, with a persistent sysctl override.
- The original zram helper was backed up. Existing zram pages were drained safely before resetting its size; available RAM plus free swap was checked first.
- The runner and CI jobs retain eight-CPU quotas and one-job capacity. Cargo parallelism was reduced from eight to four after container-scoped linker OOMs during startup. The 6 GiB memory / 8 GiB memory-plus-swap job limits were retained.

The VM-specific migration is preserved in [configure_bounded_zram.py](../tools/configure_bounded_zram.py). It expects the existing AI VM helper and `/dev/zram0`; it is not a general host installer. Run as root during maintenance, with sufficient disk-swap headroom.

## Recovery checks

After migration, zram reached its new logical capacity, disk swap took overflow, and zram reported zero failed writes. The model API and room returned HTTP 200 from the client computer, and a small text completion returned the correct answer. All three migrated Hermes gateways were active, and the runner daemon was recreated with its eight-CPU quota intact. The model loaded the existing baked checkpoint and resumed serving requests. No new GPU CAT fault was observed during recovery.

CI linker OOMs occurred before the Cargo parallelism change; this is not a claim that those CI tasks succeeded. No additional CI job or performance benchmark was launched for this recovery. The corrected swap configuration removes the observed write-rejection mechanism, but the VM still has only 12.5 GiB of RAM shared by inference, agent subprocesses, and CI. Sustained overload can still cause disk paging or workload failures; no long-duration stability guarantee is claimed.
