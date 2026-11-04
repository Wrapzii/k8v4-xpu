"""Summarize MTP draft top-k logs against verifier choices.

The input is the JSONL written by mtp_topk_log.py, plus the optional client
run log that names each request. Tokens after a miss are ignored.
"""

from __future__ import annotations

import json
import sys
from collections import Counter
from pathlib import Path

from k8v4_v030.mtp_topk_log import label_miss, swap_counts, valid_positions


def load_jsonl(path: Path) -> list[dict]:
    rows = []
    if not path.is_file():
        return rows
    for line in path.read_text(encoding="utf-8").splitlines():
        line = line.strip()
        if line:
            rows.append(json.loads(line))
    return rows


def step_records(rows: list[dict]) -> list[dict]:
    """Drop breadcrumbs. A breadcrumb-only file is not a measurement."""
    kept = []
    for row in rows:
        if not isinstance(row, dict) or "positions" not in row:
            continue
        if row.get("kind") == "breadcrumb":
            continue
        kept.append(row)
    return kept


def attach_names(records: list[dict], runs: list[dict]) -> None:
    for record in records:
        stamp = record.get("t")
        record["name"] = "unscoped"
        if stamp is None:
            continue
        for run in runs:
            if run["t0"] <= stamp <= run["t1"] + 1.0:
                record["name"] = run["name"]
                record["prompt_tokens"] = run.get("prompt_tokens")
                break


def context_len(row: dict) -> int | None:
    prompt = row.get("prompt_tokens")
    if isinstance(prompt, int) and prompt > 0:
        return prompt
    seq = row.get("seq")
    if isinstance(seq, int) and seq > 0:
        return seq
    return None


def bucket(seq: int | None) -> str:
    if seq is None:
        return "unknown"
    if seq < 4000:
        return "under_4k"
    if seq < 16000:
        return "4k_16k"
    if seq < 48000:
        return "16k_48k"
    return "48k_plus"


def miss_rows(records: list[dict]) -> list[dict]:
    found = []
    for record in records:
        if not record.get("matched_proposal"):
            continue
        miss = record.get("miss")
        if miss is None:
            continue
        for position in record["positions"]:
            if position["i"] == miss and not position.get("after_miss"):
                found.append(position)
                break
    return found


def summarize(records: list[dict]) -> dict:
    matched = [row for row in records if row.get("matched_proposal")]
    drafted = sum(int(row["n_draft"]) for row in matched)
    accepted = sum(int(row["n_accept"]) for row in matched)
    committed = sum(int(row["committed"]) for row in matched)
    misses = miss_rows(matched)
    labels = Counter(label_miss(position) for position in misses)
    depths = Counter(int(position["i"]) for position in misses)
    verify_ids = Counter(int(position["verify"]) for position in misses)
    high = sum(1 for position in misses if int(position["verify"]) >= 200000)
    by_bucket: dict[str, dict] = {}
    for name in ("under_4k", "4k_16k", "16k_48k", "48k_plus", "unknown"):
        group = [row for row in matched if bucket(context_len(row)) == name]
        if not group:
            continue
        group_misses = miss_rows(group)
        by_bucket[name] = {
            "steps": len(group),
            "drafted": sum(int(row["n_draft"]) for row in group),
            "accepted": sum(int(row["n_accept"]) for row in group),
            "committed_mean": round(
                sum(int(row["committed"]) for row in group) / len(group), 3
            ),
            "misses": len(group_misses),
            "labels": dict(Counter(label_miss(position) for position in group_misses)),
        }
    thresholds = {}
    for tau in (0.25, 0.5, 1.0, 2.0):
        thresholds[str(tau)] = swap_counts(matched, tau)
    return {
        "steps": len(records),
        "matched_steps": len(matched),
        "unmatched_steps": len(records) - len(matched),
        "drafted": drafted,
        "accepted": accepted,
        "acceptance": round(accepted / drafted, 4) if drafted else None,
        "committed_mean": round(committed / len(matched), 3) if matched else None,
        "misses": len(misses),
        "labels": dict(labels),
        "miss_depth": dict(depths),
        "high_id_misses": high,
        "common_verify_ids": verify_ids.most_common(8),
        "buckets": by_bucket,
        "swap": thresholds,
        "valid_positions": sum(len(valid_positions(row)) for row in matched),
    }


def recommendation(summary: dict) -> str:
    misses = summary["misses"]
    if summary["matched_steps"] < 20 or misses < 10:
        return "too few matched steps to judge a tree"
    labels = summary["labels"]
    rescued = int(labels.get("rank2", 0)) + int(labels.get("rank3", 0))
    rate = rescued / misses
    swap = summary["swap"].get("0.5", {})
    positions = int(swap.get("positions", 0))
    top1 = int(swap.get("top1", 0))
    top2 = int(swap.get("top2", 0))
    if rate < 0.25:
        return (
            "reject tree: verifier token is in draft top-2 or top-3 on "
            "%d of %d misses (%.1f%%). Fine-tuning the MTP head is the "
            "higher-leverage next step."
            % (rescued, misses, 100.0 * rate)
        )
    swap_note = ""
    if positions:
        swap_note = (
            " At margin < 0.5, top-1 is still the verifier on %d/%d valid "
            "positions and top-2 on %d/%d, so swapping to top-2 without also "
            "keeping top-1 loses the agreed cases."
            % (top1, positions, top2, positions)
        )
    return (
        "top-2/top-3 would start the right branch on %d of %d misses "
        "(%.1f%%). A second full verifier pass does not pay for that, "
        "because one extra step already produces about %.2f tokens. "
        "A same-forward tree would need a non-linear mask this kernel "
        "does not have.%s"
        % (rescued, misses, 100.0 * rate, summary["committed_mean"] or 0.0, swap_note)
    )


def render(summary: dict) -> str:
    lines = [
        "matched_steps %s" % summary["matched_steps"],
        "unmatched_steps %s" % summary["unmatched_steps"],
        "acceptance %s" % summary["acceptance"],
        "committed_mean %s" % summary["committed_mean"],
        "misses %s" % summary["misses"],
        "labels %s" % json.dumps(summary["labels"], sort_keys=True),
        "miss_depth %s" % json.dumps(summary["miss_depth"], sort_keys=True),
        "high_id_misses %s" % summary["high_id_misses"],
        "common_verify_ids %s" % summary["common_verify_ids"],
        "buckets %s" % json.dumps(summary["buckets"], sort_keys=True),
        "swap %s" % json.dumps(summary["swap"], sort_keys=True),
        "recommendation %s" % recommendation(summary),
    ]
    return "\n".join(lines) + "\n"


def main(argv: list[str]) -> int:
    if len(argv) < 2:
        raise SystemExit("usage: mtp_topk_report.py TOPK.jsonl [RUNS.jsonl]")
    records = step_records(load_jsonl(Path(argv[1])))
    runs = load_jsonl(Path(argv[2])) if len(argv) > 2 else []
    attach_names(records, runs)
    summary = summarize(records)
    by_name: dict[str, int] = Counter(row.get("name", "unscoped") for row in records)
    text = render(summary) + "names %s\n" % json.dumps(dict(by_name), sort_keys=True)
    sys.stdout.write(text)
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
