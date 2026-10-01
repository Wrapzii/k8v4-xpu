"""Verify and adapt Swift 1.5 AutoRound's GPTQ packing for the tested XPU loader.

Run on a fresh downloaded checkpoint directory. Original weight payloads are
never rewritten; upstream metadata is backed up before the loader config changes.
"""
from pathlib import Path
import json,struct,array,shutil
import argparse
parser=argparse.ArgumentParser(description='Adapt Swift 1.5 AutoRound GPTQ packing for the deployed XPU loader without changing weight values.')
parser.add_argument('checkpoint',type=Path)
p=parser.parse_args().checkpoint.resolve()
if (p/'COMPATIBILITY.json').exists(): raise SystemExit('Checkpoint is already adapted; use a fresh upstream copy to repeat conversion.')
c=json.loads((p/'config.json').read_text()); q=c['quantization_config']
assert q['packing_format']=='auto_round:auto_gptq'
assert q['bits']==4 and q['group_size']==128 and q['sym'] is True
idx=json.loads((p/'model.safetensors.index.json').read_text()); wm=idx['weight_map']; headers={}
for name in set(wm.values()):
 if Path(name).name!=name: raise ValueError('Shard names must be basenames')
 with (p/name).open('rb') as f:
  length=struct.unpack('<Q',f.read(8))[0]; h=json.loads(f.read(length)); headers[name]=(h,8+length)
gidx={}; pieces=[]; offset=0; count=0
for key,name in list(wm.items()):
 if not key.endswith('.qweight'): continue
 prefix=key[:-len('.qweight')]
 h,start=headers[name]; info=h[key]; shape=info['shape']
 assert info['dtype']=='I32' and len(shape)==2
 n=shape[0]*8
 assert n%128==0
 zero_key=prefix+'.qzeros'; zh,zstart=headers[wm[zero_key]]; zi=zh[zero_key]
 with (p/wm[zero_key]).open('rb') as f:
  f.seek(zstart+zi['data_offsets'][0]); data=f.read(zi['data_offsets'][1]-zi['data_offsets'][0])
 # GPTQ symmetric zero-point 8 is stored as 7 in each nibble.
 assert all(v[0]==0x77777777 for v in struct.iter_unpack('<I',data)),prefix+' incompatible zero-point packing'
 gi=prefix+'.g_idx'
 if gi not in wm:
  raw=array.array('i',(i//128 for i in range(n))).tobytes()
  gidx[gi]={'dtype':'I32','shape':[n],'data_offsets':[offset,offset+len(raw)]};pieces.append(raw);offset+=len(raw)
  wm[gi]='compat_g_idx.safetensors'
 count+=1
assert count==400,count
header=json.dumps(gidx,separators=(',',':')).encode();header+=b' '*((-len(header))%8)
with (p/'compat_g_idx.safetensors').open('wb') as f:
 f.write(struct.pack('<Q',len(header)));f.write(header)
 for raw in pieces:f.write(raw)
for file in ('config.json','model.safetensors.index.json','chat_template.jinja'):
 shutil.copy2(p/file,p/(file+'.upstream'))
qnew={'quant_method':'gptq','bits':4,'group_size':128,'sym':True,'desc_act':False,'lm_head':False,'dynamic':{'-:.*visual.*':{},'-:.*mtp.*':{},'-:.*in_proj_a.*':{},'-:.*in_proj_b.*':{}}}
c['quantization_config']=qnew
(p/'config.json').write_text(json.dumps(c,indent=2)+'\n')
(p/'quantize_config.json').write_text(json.dumps(qnew,indent=2)+'\n')
idx.setdefault('metadata',{})['total_size']=idx.get('metadata',{}).get('total_size',0)+offset
(p/'model.safetensors.index.json').write_text(json.dumps(idx,indent=2)+'\n')
t=(p/'chat_template.jinja').read_text().replace("reasoning_effort|default('xhigh')","reasoning_effort|default('low')")
(p/'chat_template_low.jinja').write_text(t)
(p/'COMPATIBILITY.json').write_text(json.dumps({'source_format':q['packing_format'],'body_linears_verified':count,'zero_points':'all packed nibbles 7; GPTQ decodes zero-point 8','added_group_indices':len(gidx),'changed_weight_values':False,'dense_lm_head':True,'dense_mtp':True,'dense_embedding':True},indent=2))
print('Verified 400 GPTQ linears; added deterministic group indices; preserved all original weight values')
