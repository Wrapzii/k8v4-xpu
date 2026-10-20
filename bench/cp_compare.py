"""Compare matched serving JSONL; no winner without repeated valid decode windows."""
import argparse
import json
from pathlib import Path
import statistics


def load(path):
    rows=[json.loads(x) for x in path.read_text(encoding='utf-8').splitlines() if x.strip()]
    groups={}
    for r in rows:
        key=(r['mode'],r['context'],r['concurrency'])
        groups.setdefault(key,[]).append(r)
    return groups


def compare(a,b):
    if set(a)!=set(b):raise ValueError('missing context/concurrency/mode cells between arms')
    out=[]
    for key in sorted(a):
        aa=a[key];bb=b[key]
        if len(aa)<3 or len(bb)<3:raise ValueError('need at least three repeats per cell')
        if len(aa)!=len(bb):raise ValueError('unmatched repeat counts')
        if any(len({r['repeat'] for r in rows})!=len(rows) for rows in (aa,bb)):
            raise ValueError('duplicate repeats do not establish replication')
        hashes={r['fixture_sha256'] for r in aa+bb};lengths={r['max_tokens'] for r in aa+bb}
        if len(hashes)!=1 or len(lengths)!=1:raise ValueError('fixture/output-length mismatch')
        if not all(r['valid_request_measurement'] for r in aa+bb):raise ValueError('invalid request cell; do not average away failed cache/preemption gates')
        if key[0]=='warm' and not all(r['valid_decode_measurement'] for r in aa+bb):
            raise ValueError('invalid warm decode cell; do not average away failed coverage')
        def summary(rows):
            rates=([statistics.mean(r['steady_common_decode']['per_stream_tps']) for r in rows]
                   if all(r['valid_decode_measurement'] for r in rows) else None)
            return {'steady_per_stream_median':statistics.median(rates) if rates else None,
                'range':[min(rates),max(rates)] if rates else None,
                'decode_unavailable_reasons':[r['steady_common_decode'].get('reason') for r in rows if not r['valid_decode_measurement']],
                'wall_aggregate_median':statistics.median(r['aggregate_wall_tps'] for r in rows),
                'ttft_median':statistics.median(q['ttft_seconds'] for r in rows for q in r['requests']),
                'acceptance':[r['acceptance'] for r in rows]}
        x=summary(aa);y=summary(bb)
        has_decode=x['steady_per_stream_median'] is not None and y['steady_per_stream_median'] is not None
        out.append({'mode':key[0],'context':key[1],'concurrency':key[2],'a':x,'b':y,
                    'decode_change_percent':100*(y['steady_per_stream_median']/x['steady_per_stream_median']-1) if has_decode else None,
                    'range_overlap':not(x['range'][1]<y['range'][0] or y['range'][1]<x['range'][0]) if has_decode else None,
                    'model_task_fidelity_validated':False})
    return out


if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('baseline',type=Path);p.add_argument('candidate',type=Path)
    a=p.parse_args();print(json.dumps(compare(load(a.baseline),load(a.candidate)),indent=2))
