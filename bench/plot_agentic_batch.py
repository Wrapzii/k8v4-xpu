"""Plot recorded positive-token SSE delivery over time, without averaging turns."""
import argparse
import json
from pathlib import Path
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np

p = argparse.ArgumentParser()
p.add_argument('--results', type=Path, required=True)
p.add_argument('--output', type=Path, required=True)
a = p.parse_args()
data = {}
for cap in (4224, 16384):
    rows = [json.loads(s) for s in (a.results / f'batch{cap}-agentic.jsonl').read_text().splitlines()]
    data[cap] = ([r for r in rows if r['kind'] == 'request'], rows[-1])
end = max(summary['wall_s'] for _, summary in data.values())
edges = np.arange(0, end + 5, 5)
colors = ['#2563eb', '#16a34a', '#b45309', '#a855f7']
fig, axes = plt.subplots(3, 1, figsize=(12, 10), sharex=True,
                         gridspec_kw={'height_ratios': [1, 1, .8]})
fig.suptitle('Continuing conversations while a fresh 128K prompt arrives\n'
             'Swift 1.5 · K8/V4 · 2× B60 · four active sequences · thinking disabled', fontsize=14)
for ax, cap in zip(axes[:2], (4224, 16384)):
    rows, summary = data[cap]
    total_times, total_counts = [], []
    for worker in range(4):
        times, counts = [], []
        for r in rows:
            if r['worker'] != worker:
                continue
            previous = 0
            for e in r['events']:
                times.append(r['start_s'] + e['t'])
                counts.append(e['tokens'] - previous)
                previous = e['tokens']
        hist, _ = np.histogram(times, bins=edges, weights=counts)
        label = f'Existing agent {worker + 1}' if worker < 3 else 'Fresh-arrival agent'
        ax.stairs(hist / 5, edges, label=label, color=colors[worker], linewidth=1.4)
        total_times.extend(times)
        total_counts.extend(counts)
    fresh = next(r for r in rows if r['fresh_long_arrival'])
    ax.axvspan(fresh['start_s'], fresh['start_s'] + fresh['ttft_s'], color='#64748b', alpha=.12,
               label='Fresh 128K prefill interval')
    ax.set_title(f'Batch-token cap {cap:,} — {summary["wall_s"]:.1f}s workload, '
                 f'{summary["output_tokens"]:,} output tokens', loc='left', fontsize=11)
    ax.set_ylabel('Delivered tokens/s\n(5-second bins)')
    ax.set_ylim(0, 110)
    ax.grid(alpha=.18)
    if cap == 4224:
        ax.legend(loc='upper right', fontsize=8, ncol=2)
    ordered = sorted(zip(total_times, total_counts))
    cumulative = np.cumsum([v for _, v in ordered])
    axes[2].step([t for t, _ in ordered], cumulative, where='post', label=f'Cap {cap:,}',
                 color='#2563eb' if cap == 4224 else '#dc2626', linewidth=1.8)
axes[2].set_ylabel('All workers\ncumulative output tokens')
axes[2].set_xlabel('Seconds since workload started')
axes[2].grid(alpha=.18)
axes[2].legend(loc='upper left')
axes[2].set_xlim(0, edges[-1])
fig.text(.08, .015, '27 synthetic coding turns; shared warmed 64K seed; one fresh 128K arrival. '
         'Bins include prefill and between-turn waits.\n'
         'Chunked SSE delivery is measured at the client; it is not a kernel-time trace. One pass per cap.', fontsize=9)
fig.tight_layout(rect=[0, .05, 1, .94])
a.output.parent.mkdir(parents=True, exist_ok=True)
fig.savefig(a.output.with_suffix('.svg'))
fig.savefig(a.output.with_suffix('.png'), dpi=160)
