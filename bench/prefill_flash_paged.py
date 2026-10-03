"""Compare installed XPU FlashAttention against the served SDPA, one 128K shape."""
import json,time,statistics,torch
import vllm_xpu_kernels
from vllm_xpu_kernels.flash_attn_interface import flash_attn_varlen_func
import vllm_xpu_kernels.flash_attn_interface as flash_interface
def deny_fallback(*args, **kwargs):
 raise RuntimeError("Blocked quadratic score-matrix fallback")
flash_interface._fallback_varlen_attn = deny_fallback

torch.xpu.set_device(0)
torch.manual_seed(6819)
torch.ops.load_library('/opt/k8v4/libk8v4_sdpa.so')
device='xpu:0'
Q=4224;K=128000;H=6;D=256
q=torch.randn(Q,H,D,device=device,dtype=torch.float16)*.3
k=torch.randn(K,1,D,device=device,dtype=torch.float16)*.3
v=torch.randn_like(k)
cq=torch.tensor([0,Q],device=device,dtype=torch.int32)
ck=torch.tensor([0,K],device=device,dtype=torch.int32)
used=torch.tensor([K],device=device,dtype=torch.int32)
table=torch.arange(K//64,device=device,dtype=torch.int32).view(1,-1)
qp=torch.zeros(4352,H,D,device=device,dtype=torch.float16);qp[-Q:]=q

def dnnl():
 dense=qp.transpose(0,1).contiguous();out=torch.empty_like(dense)
 torch.ops.k8v4_sdpa.sdpa_len(dense,k.transpose(0,1).contiguous(),v.transpose(0,1).contiguous(),out,1/16,K,4352)
 return out.transpose(0,1)[-Q:].contiguous()

def flash():
 return flash_attn_varlen_func(q,k.view(K//64,64,1,D),v.view(K//64,64,1,D),max_seqlen_q=Q,cu_seqlens_q=cq,max_seqlen_k=K,seqused_k=used,block_table=table,causal=True,softmax_scale=1/16,fa_version=2)

answers={}
for name,fn in [('onednn',dnnl),('flash',flash)]:
 answer=fn();torch.xpu.synchronize();answers[name]=answer
 samples=[]
 for _ in range(12):
  torch.xpu.synchronize();t=time.perf_counter();result=fn();torch.xpu.synchronize();samples.append((time.perf_counter()-t)*1000);del result
 print(json.dumps({'kind':'timing','backend':name,'query':Q,'kv':K,'median_ms':statistics.median(samples),'samples_ms':samples}),flush=True)

index=torch.tensor([0,Q//2,Q-1],device=device)
qq=q[index].transpose(0,1).float()
scores=torch.matmul(qq,k[:,0].float().T)*(1/16)
positions=index+K-Q
allowed=torch.arange(K,device=device)[None,:]<=positions[:,None]
scores=scores.masked_fill(~allowed[None,:,:],float('-inf'))
reference=torch.matmul(torch.softmax(scores,dim=-1),v[:,0].float()).transpose(0,1)
for name,answer in answers.items():
 sampled=answer[index].float()
 error=(sampled-reference).abs()
 torch.testing.assert_close(sampled,reference,atol=2e-5,rtol=.02)
 print(json.dumps({'kind':'oracle','backend':name,'sampled_rows':3,'max_abs_error':error.max().item(),'relative_rms_error':(error.square().mean().sqrt()/reference.square().mean().sqrt()).item(),'passed':True}),flush=True)
error=(answers['flash'].float()-answers['onednn'].float()).abs()
print(json.dumps({'kind':'comparison','max_abs_error':error.max().item(),'mean_abs_error':error.mean().item()}),flush=True)
