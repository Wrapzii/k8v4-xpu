import json,glob,sys,os,collections
d=sys.argv[1]; base=sys.argv[2] if len(sys.argv)>2 else 'prod'
R=collections.defaultdict(lambda: collections.defaultdict(list))
for f in glob.glob(os.path.join(d,'*-r*.jsonl')):
    n=os.path.basename(f).rsplit('-r',1)[0]
    for l in open(f):
        r=json.loads(l); R[n][(r['ctx'],r['batch'],r['q_len'])].append(r)
keys=sorted({k for n in R for k in R[n]})
names=[base]+sorted(n for n in R if n!=base)
print('best-of-reps p50 us/req (s1/s2); speedup vs %s'%base)
print('ctx,b,ql | '+' | '.join(names))
for k in keys:
    row=[]
    b=min((x['us_per_req'] for x in R[base].get(k,[])),default=None)
    for n in names:
        xs=R[n].get(k,[])
        if not xs: row.append('-'); continue
        x=min(xs,key=lambda x:x['us_per_req'])
        sp=' x%.2f'%(b/x['us_per_req']) if b and n!=base else ''
        row.append('%.0f (%.0f/%.0f) n%d%s'%(x['us_per_req'],x['s1_us_req_p50'] or 0,x['s2_us_req_p50'] or 0,len(xs),sp))
    print('%d,%d,%d | '%k+' | '.join(row))
