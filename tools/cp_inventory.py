"""Save build/launch identity and actual CP rank reports, without credentials."""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import subprocess


def call(args):return subprocess.check_output(args,text=True,stderr=subprocess.STDOUT)


def rank_gate(reports):
    ranks={r['global_rank']:r for r in reports}
    if set(ranks)!={0,1,2,3}:return False
    physical=set()
    for r in reports:
        i=r['global_rank']
        if (r['tp_ranks']!=([0,1] if i<2 else [2,3]) or
            r['cp_ranks']!=([0,2] if i%2==0 else [1,3]) or r['cp_lane']!=i//2):return False
        try:physical.add(r['affinity'].split(',')[int(r['device'])])
        except (AttributeError,IndexError,KeyError,TypeError,ValueError):return False
    return len(physical)==4


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--container',required=True)
    p.add_argument('--output',type=Path,required=True)
    p.add_argument('--layout',choices=('tp2','tp2cp2'),required=True)
    a=p.parse_args()
    if a.output.exists():raise SystemExit('inventory exists; use a new output')
    info=json.loads(call(['docker','inspect',a.container]))[0]
    argv=info['Config']['Cmd'] or []
    safe=[];redact=False
    for arg in argv:
        if redact:safe.append('<redacted>');redact=False;continue
        if arg.split('=',1)[0] in ('--api-key','--hf-token'):
            safe.append(arg.split('=',1)[0]+'=<redacted>');redact='=' not in arg
        else:safe.append(arg)
    env={}
    for entry in info['Config']['Env']:
        k,_,v=entry.partition('=')
        if k.startswith(('K8V4_','XE2_','CCL_','ZE_','B70_')) or k in ('VLLM_USE_V2_MODEL_RUNNER','VLLM_XPU_ENABLE_XPU_GRAPH','PYTORCH_ALLOC_CONF'):
            env[k]=v
    code='''import hashlib,importlib.util,json,os,pathlib,torch
paths={"native":os.environ.get("XE2_KV_LIB","/opt/k8v4/libxe2_kv.so"),"sdpa":os.environ.get("K8V4_SDPA_LIB","/opt/k8v4/libk8v4_sdpa.so")}
out={"torch":torch.__version__,"files":{},"vllm_origin":importlib.util.find_spec("vllm").origin}
receipt=pathlib.Path("/opt/k8v4/cp-install-receipt.json")
out["cp_install_receipt"]=json.loads(receipt.read_text()) if receipt.exists() else None
for key,path in paths.items():
 p=pathlib.Path(path);out["files"][key]={"path":path,"sha256":hashlib.sha256(p.read_bytes()).hexdigest() if p.exists() else None}
print(json.dumps(out))
'''
    binary=json.loads(call(['docker','exec',a.container,'python3','-c',code]).splitlines()[-1])
    logs=call(['docker','logs','--since',info['State']['StartedAt'],a.container])
    reports=[];parse_errors=[]
    for line in logs.splitlines():
        if 'K8V4_CP_RUNTIME ' in line:
            try:reports.append(json.JSONDecoder().raw_decode(line.split('K8V4_CP_RUNTIME ',1)[1])[0])
            except (ValueError,KeyError) as exc:parse_errors.append(str(exc))
    ranks={r['global_rank']:r for r in reports}
    rank_ok=rank_gate(reports) and not parse_errors
    out={'layout':a.layout,'container_id':info['Id'],'image_id':info['Image'],
         'started':info['State']['StartedAt'],'running':info['State']['Running'],
         'argv':safe,'environment':env,'binary':binary,'runtime_ranks':ranks,
         'runtime_report_parse_errors':parse_errors,
         'four_rank_group_gate':rank_ok if a.layout=='tp2cp2' else None}
    for key,args in (('git_head',['git','rev-parse','HEAD']),('git_dirty',['git','status','--porcelain'])):
        try:out[key]=call(args).strip()
        except subprocess.CalledProcessError:out[key]=None
    try:out['pci_devices']=call(['lspci','-D','-nn'])
    except (FileNotFoundError,subprocess.CalledProcessError):out['pci_devices']=None
    a.output.parent.mkdir(parents=True,exist_ok=True);a.output.write_text(json.dumps(out,indent=2),encoding='utf-8')
    if a.layout=='tp2cp2' and not rank_ok:
        raise SystemExit('FAIL: missing or wrong four-rank runtime reports; inspect inventory, do not publish speed claims')
    print(a.output)


if __name__=='__main__':main()
