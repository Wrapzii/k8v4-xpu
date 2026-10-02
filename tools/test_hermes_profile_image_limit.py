import copy
import json
from pathlib import Path
from agent.context_compressor import evict_stale_outbound_tool_images, _image_payload
from agent.image_eviction_policy import configured_outbound_image_limit
from agent.image_eviction_policy import configured_outbound_image_limit


def test_profile_image_limit_and_saved_history(tmp_path, monkeypatch):
    homes=[]
    for limit in (4, 20):
        home=tmp_path/str(limit);home.mkdir()
        (home/'config.yaml').write_text(f'model:\n  max_images_per_request: {limit}\n',encoding='utf-8');homes.append(home)
    original=[{'role':'user','content':[{'type':'image_url','image_url':{'url':'data:image/png;base64,AAAA'}}]}]
    for i in range(6):
        original.append({'role':'tool','tool_call_id':str(i),'content':[{'type':'text','text':f'frame {i}'},{'type':'image_url','image_url':{'url':'data:image/png;base64,AAAA'}}]})
    saved=copy.deepcopy(original)
    for home,limit in ((homes[0],4),(homes[1],20),(homes[0],4)):
        monkeypatch.setenv('HERMES_HOME',str(home))
        outbound=copy.deepcopy(original)
        evict_stale_outbound_tool_images(outbound, limit=configured_outbound_image_limit())
        assert sum(_image_payload(m)[0] for m in outbound)<=limit
        assert outbound[0]==saved[0]
        assert [m['tool_call_id'] for m in outbound[1:]]==[str(i) for i in range(6)]
        assert original==saved
        assert _image_payload(outbound[-1])[0]==1


def test_disabled_limit_keeps_default_policy(tmp_path, monkeypatch):
    (tmp_path/'config.yaml').write_text('model:\n  max_images_per_request: 0\n',encoding='utf-8')
    monkeypatch.setenv('HERMES_HOME',str(tmp_path))
    outbound=[{'role':'tool','content':[{'type':'image_url','image_url':{'url':'data:image/png;base64,AAAA'}}]} for _ in range(5)]
    assert evict_stale_outbound_tool_images(outbound, limit=configured_outbound_image_limit())==0
