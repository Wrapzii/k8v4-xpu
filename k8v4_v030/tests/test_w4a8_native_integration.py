"""Real MLP dispatch with CPU tensor math; native/GEMM device boundaries substituted."""
from contextlib import ExitStack
from types import SimpleNamespace
from unittest.mock import patch
import torch
import pytest
from k8v4_v030 import w4a8_prefill as gemm


@pytest.fixture(autouse=True)
def cpu_only_device_discovery(monkeypatch):
    # Dynamo registers device interfaces even with backend='eager'. Keep its
    # discovery CPU-only without consulting CUDA/XPU drivers on the test host.
    for backend in (torch.cuda, torch.xpu):
        monkeypatch.setattr(backend, 'is_available', lambda: False)
        monkeypatch.setattr(backend, 'device_count', lambda: 0)


@pytest.fixture(autouse=True)
def trusted_linux_metadata_for_existing_loader_cases(request):
    # Existing tests exercise hash/dispatcher semantics, not host filesystem ACLs.
    # Emulate admin-installed Linux components on the Windows CPU test host.
    names = {'test_requested_native_library_wrong_pin_fails_before_load',
             'test_installer_loads_matching_pin_and_opt_out_clears_native',
             'test_rejects_preexisting_dispatcher_before_loading_real_pinned_library',
             'test_failed_load_or_validation_requires_restart',
             'test_rejects_preexisting_implementation_without_schema'}
    if request.node.name not in names:
        yield
        return
    # Initialize pytest's platform-dependent temp root before emulating Linux.
    request.getfixturevalue('tmp_path')
    import stat
    from pathlib import Path
    original = Path.lstat
    def trusted(path):
        info = original(path)
        mode = stat.S_IFMT(info.st_mode) | (0o755 if stat.S_ISDIR(info.st_mode) else 0o644)
        return SimpleNamespace(st_uid=0, st_mode=mode)
    with patch('sys.platform', 'linux'), patch.object(Path, 'lstat', trusted):
        yield


def test_opaque_mlp_consumes_native_quantizer_outputs():
    generator=torch.Generator().manual_seed(71)
    x=torch.randn((129,32),generator=generator,dtype=torch.float16)
    weights=torch.randint(-7,8,(32,16),generator=generator).float()
    packed=torch.zeros((4,16),dtype=torch.int32)
    scales=torch.ones((1,16),dtype=torch.float16)
    zeros=torch.zeros((1,16),dtype=torch.int32)
    seen=[]
    def native(flat):
        seen.append('native')
        return gemm._quantize_stored(flat)
    def matmul(q,s,z,*args):
        seen.append('gemm')
        assert not torch.count_nonzero(z)
        return ((q.float()*s.float()) @ weights).half()
    q,s,z=gemm._quantize_stored(x)
    expected=((q.float()*s.float()) @ weights).half()
    with ExitStack() as scope:
        for name,value in (('_RUNTIME_ENABLED',True),('_FUSED_QUANT_OP',native),
                           ('_QUANT_COMPILED',gemm._quantize_stored),('w4a8_gemm',matmul)):
            scope.enter_context(patch.object(gemm,name,value,create=True))
        scope.enter_context(patch.object(gemm,'_native_quant_supported',return_value=True,create=True))
        actual=gemm.runtime_mlp_gemm(x,packed,scales,zeros,128,None)
    assert seen==['native','gemm'],'actual opaque serving MLP must consume the native tuple'
    assert torch.equal(actual,expected)


def test_eager_mlp_consumes_native_quantizer_outputs():
    x=torch.ones((129,32),dtype=torch.float16)
    layer=SimpleNamespace(qweight=torch.zeros((16,4),dtype=torch.int32),
                          scales=torch.ones((1,16),dtype=torch.float16),
                          qzeros=torch.zeros((1,16),dtype=torch.int32))
    kernel=SimpleNamespace(w_q_name='qweight',w_s_name='scales',w_zp_name='qzeros',
                           config=SimpleNamespace(group_size=128))
    seen=[]
    def native(flat):
        seen.append('native')
        return gemm._quantize_stored(flat)
    def matmul(q,s,z,*args):
        seen.append('gemm')
        return (q.float()*s.float()).sum(-1,keepdim=True).expand(-1,16).half().clone()
    with patch.object(gemm,'_FUSED_QUANT_OP',native), \
         patch.object(gemm,'_native_quant_supported',return_value=True), \
         patch.object(gemm,'w4a8_gemm',matmul):
        actual=gemm._apply_w4a8(kernel,layer,x,None)
    assert seen==['native','gemm']
    q,s,_=gemm._quantize_stored(x)
    assert torch.equal(actual,(q.float()*s.float()).sum(-1,keepdim=True).expand(-1,16).half())


def test_compiled_opaque_mlp_switches_native_prefill_and_unchanged_decode():
    packed=torch.zeros((4,16),dtype=torch.int32)
    scales=torch.ones((1,16),dtype=torch.float16)
    zeros=torch.zeros((1,16),dtype=torch.int32)
    seen=[]
    def native(x):
        seen.append(('native',x.shape[0]))
        return gemm._quantize_stored(x)
    def decode(x,*args):
        seen.append(('decode',x.shape[0]))
        return x.new_zeros((x.shape[0],16))
    def matmul(q,*args):
        return torch.zeros((q.shape[0],16),dtype=torch.float16)
    fn=torch.compile(lambda x:gemm.runtime_mlp_gemm(x,packed,scales,zeros,128,None),
                     backend='eager',dynamic=True,fullgraph=True)
    with patch.object(gemm,'_RUNTIME_ENABLED',True), \
         patch.object(gemm,'_FUSED_QUANT_OP',native), \
         patch.object(gemm,'_native_quant_supported',return_value=True), \
         patch.object(gemm,'_w4a16_runtime',decode), \
         patch.object(gemm,'w4a8_gemm',matmul):
        for rows in (28,128,129,512,28):
            result=fn(torch.ones((rows,32),dtype=torch.float16))
            assert result.shape==(rows,16)
        with patch.object(gemm,'_RUNTIME_ENABLED',False):
            fn(torch.ones((512,32),dtype=torch.float16))
    assert seen==[('decode',28),('decode',128),('native',129),('native',512),
                  ('decode',28),('decode',512)]


def test_cpu_and_bfloat16_keep_existing_quantizer_without_precision_conversion():
    for dtype in (torch.float16,torch.bfloat16):
        x=torch.ones((129,32),dtype=dtype)
        seen=[]
        def fallback(y):
            seen.append(y.dtype)
            return gemm._quantize_stored(y)
        def forbidden(*args):
            raise AssertionError('unsupported tensor reached native quantizer')
        def matmul(q,*args):
            return torch.zeros((q.shape[0],16),dtype=torch.float16)
        with patch.object(gemm,'_RUNTIME_ENABLED',True), \
             patch.object(gemm,'_FUSED_QUANT_OP',forbidden), \
             patch.object(gemm,'_QUANT_COMPILED',fallback), \
             patch.object(gemm,'w4a8_gemm',matmul):
            out=gemm.runtime_mlp_gemm(x,torch.zeros((4,16),dtype=torch.int32),
                                    torch.ones((1,16)),torch.zeros((1,16),dtype=torch.int32),128,None)
        assert seen==[dtype]
        assert out.dtype==dtype


def test_native_shape_policy_matches_bridge_bounds_without_device_access():
    def tensor(rows=129,cols=32,dtype=torch.float16,contiguous=True,ndim=2,device='xpu'):
        return SimpleNamespace(device=SimpleNamespace(type=device),dtype=dtype,ndim=ndim,
                               shape=(rows,cols),is_contiguous=lambda:contiguous)
    assert gemm._native_quant_supported(tensor())
    assert gemm._native_quant_supported(tensor(16384,32768))
    for x in (tensor(0),tensor(16385),tensor(cols=0),tensor(cols=32769),
              tensor(dtype=torch.bfloat16),tensor(contiguous=False),tensor(ndim=3),tensor(device='cpu')):
        assert not gemm._native_quant_supported(x)


def test_requested_native_library_wrong_pin_fails_before_load(tmp_path):
    import pytest
    path=tmp_path/'private.so'
    path.write_bytes(b'CPU fixture, not an executable library')
    env={'K8V4_PREFILL_GEMM':'w4a8','K8V4_W4A8_FUSED_QUANT':'1',
         'K8V4_W4A8_FUSED_QUANT_LIB':str(path),'K8V4_W4A8_FUSED_QUANT_SHA256':'0'*64}
    with patch.dict(__import__('os').environ,env), \
         patch.object(gemm,'_RUNTIME_ENABLED',False), \
         patch.object(gemm,'_FUSED_QUANT_OP',None), \
         patch.object(gemm,'install') as install, \
         patch.object(torch.ops,'load_library') as load:
        with pytest.raises(RuntimeError,match='SHA256'):
            gemm.install_if_requested()
        load.assert_not_called()
        install.assert_not_called()
        assert not gemm._RUNTIME_ENABLED


def test_requested_native_library_missing_pin_fails_closed():
    import pytest
    env={'K8V4_PREFILL_GEMM':'w4a8','K8V4_W4A8_FUSED_QUANT':'1',
         'K8V4_W4A8_FUSED_QUANT_LIB':'','K8V4_W4A8_FUSED_QUANT_SHA256':''}
    with patch.dict(__import__('os').environ,env), \
         patch.object(gemm,'_RUNTIME_ENABLED',False), \
         patch.object(gemm,'_FUSED_QUANT_OP',None), \
         patch.object(gemm,'install') as install:
        with pytest.raises(RuntimeError,match='SHA256'):
            gemm.install_if_requested()
        install.assert_not_called()
        assert not gemm._RUNTIME_ENABLED


def test_installer_loads_matching_pin_and_opt_out_clears_native(tmp_path):
    import hashlib
    from unittest.mock import Mock
    path=tmp_path/'private.so'
    contents=b'CPU fixture, not an executable library'
    path.write_bytes(contents)
    digest=hashlib.sha256(contents).hexdigest()
    op=Mock()
    op._schema='k8v4_w4a8::quant_rows(Tensor x) -> (Tensor, Tensor, Tensor)'
    env={'K8V4_PREFILL_GEMM':'w4a8','K8V4_W4A8_FUSED_QUANT':'1',
         'K8V4_W4A8_FUSED_QUANT_LIB':str(path),'K8V4_W4A8_FUSED_QUANT_SHA256':digest}
    with patch.dict(__import__('os').environ,env), \
         patch.object(gemm,'_RUNTIME_ENABLED',False), \
         patch.object(gemm,'_FUSED_QUANT_OP',None), \
         patch.object(gemm,'_FUSED_QUANT_LOAD_ATTEMPTED',False), \
         patch.object(gemm,'install') as install, \
         patch.object(torch.ops,'load_library') as load, \
         patch.object(torch.ops.k8v4_w4a8,'quant_rows',SimpleNamespace(default=op),create=True), \
         patch.object(torch._C,'_dispatch_has_kernel_for_dispatch_key',return_value=True):
        gemm.install_if_requested()
        load.assert_called_once_with(str(path.resolve()))
        install.assert_called_once()
        assert gemm._FUSED_QUANT_OP is op
        assert gemm._RUNTIME_ENABLED
        with patch.dict(__import__('os').environ,{'K8V4_PREFILL_GEMM':'w4a16'}):
            gemm.install_if_requested()
        assert not gemm._RUNTIME_ENABLED
        assert gemm._FUSED_QUANT_OP is None


def test_rejects_preexisting_dispatcher_before_loading_real_pinned_library():
    import _ctypes
    import hashlib
    import os
    from pathlib import Path
    import pytest
    path = Path(_ctypes.__file__).resolve()
    env = {"K8V4_W4A8_FUSED_QUANT_LIB": str(path),
           "K8V4_W4A8_FUSED_QUANT_SHA256": hashlib.sha256(path.read_bytes()).hexdigest()}
    lib = torch.library.Library("k8v4_w4a8", "DEF")
    lib.define("quant_rows(Tensor x) -> (Tensor, Tensor, Tensor)")
    lib.impl("quant_rows", lambda x: (x, x, x), "XPU")
    lib.impl("quant_rows", lambda x: (x, x, x), "Meta")
    with patch.dict(os.environ, env), patch.object(torch.ops, "load_library", wraps=torch.ops.load_library) as load:
        with pytest.raises(RuntimeError, match="already registered"):
            gemm._load_fused_quantizer()
        load.assert_not_called()


def _exercise_stream_case(route, native, matmul):
    x = torch.arange(129 * 32, dtype=torch.float16).reshape(129, 32) / 100
    layer = SimpleNamespace(qweight=torch.zeros((16,4), dtype=torch.int32),
                            scales=torch.ones((1,16), dtype=torch.float16),
                            qzeros=torch.zeros((1,16), dtype=torch.int32))
    kernel = SimpleNamespace(w_q_name="qweight", w_s_name="scales", w_zp_name="qzeros",
                             config=SimpleNamespace(group_size=128))
    with (patch.object(gemm, "_FUSED_QUANT_OP", native),
          patch.object(gemm, "_native_quant_supported", return_value=True),
          patch.object(gemm, "_RUNTIME_ENABLED", True),
          patch.object(gemm, "_QUANT_COMPILED", gemm._quantize_stored),
          patch.object(gemm, "w4a8_gemm", matmul)):
        if route == "eager":
            return gemm._apply_w4a8(kernel, layer, x, None)
        return gemm.runtime_mlp_gemm(x, layer.qweight.t(), layer.scales, layer.qzeros, 128, None)


def test_eager_out_of_order_falls_back():
    _assert_stream_fallback("eager")


def test_opaque_out_of_order_falls_back():
    _assert_stream_fallback("opaque")


def _assert_stream_fallback(route):
    seen = []
    def native(x):
        seen.append("native")
        # Pinned torch_xpu_bridge.cpp checks this before allocations/submission.
        raise RuntimeError("B4 requires an in-order current XPU stream")
    def matmul(q, scale, zero, *args):
        seen.append("gemm")
        assert torch.count_nonzero(zero) == 0
        return (q.float() * scale.float()).sum(-1, keepdim=True).expand(-1, 16).half().clone()
    actual = _exercise_stream_case(route, native, matmul)
    x = torch.arange(129 * 32, dtype=torch.float16).reshape(129, 32) / 100
    q, scale, _ = gemm._quantize_stored(x)
    expected = (q.float() * scale.float()).sum(-1, keepdim=True).expand(-1, 16).half()
    assert torch.equal(actual, expected)
    assert seen == ["native", "gemm"]


def test_native_and_gemm_errors_propagate_without_retry():
    import pytest
    for route in ("eager", "opaque"):
        for message in ("native kernel failed", "B4 quant submission failed: 1",
                        "B4 requires an in-order current XPU stream extra",
                        "prefix B4 requires an in-order current XPU stream",
                        "qualified quantizer requires in-order XPU stream"):
            def native(x):
                raise RuntimeError(message)
            with pytest.raises(RuntimeError, match=message):
                _exercise_stream_case(route, native, lambda *a: pytest.fail("GEMM reached"))
        def bad_gemm(*args):
            raise RuntimeError("B4 requires an in-order current XPU stream")
        with pytest.raises(RuntimeError, match="B4 requires an in-order current XPU stream"):
            _exercise_stream_case(route, gemm._quantize_stored, bad_gemm)


def test_failed_load_or_validation_requires_restart(tmp_path):
    import hashlib
    import os
    import pytest
    path = tmp_path / "fixture.so"
    path.write_bytes(b"fixture")
    env = {"K8V4_W4A8_FUSED_QUANT_LIB": str(path),
           "K8V4_W4A8_FUSED_QUANT_SHA256": hashlib.sha256(path.read_bytes()).hexdigest()}
    for failure in ("load", "schema"):
        op = SimpleNamespace(_schema="incorrect schema")
        with (patch.dict(os.environ, env),
              patch.object(gemm, "_FUSED_QUANT_LOAD_ATTEMPTED", False),
              patch.object(torch.ops, "load_library", side_effect=RuntimeError("load failed") if failure == "load" else None) as load,
              patch.object(torch.ops.k8v4_w4a8, "quant_rows", SimpleNamespace(default=op), create=True)):
            with pytest.raises(RuntimeError, match="load failed|schema mismatch"):
                gemm._load_fused_quantizer()
            with pytest.raises(RuntimeError, match="restart required"):
                gemm._load_fused_quantizer()
            assert load.call_count == 1


def test_rejects_preexisting_implementation_without_schema():
    import _ctypes
    import hashlib
    import os
    from pathlib import Path
    import pytest
    path = Path(_ctypes.__file__).resolve()
    env = {"K8V4_W4A8_FUSED_QUANT_LIB": str(path),
           "K8V4_W4A8_FUSED_QUANT_SHA256": hashlib.sha256(path.read_bytes()).hexdigest()}
    lib = torch.library.Library("k8v4_w4a8", "IMPL")
    lib.impl("quant_rows", lambda x: (x, x, x), "XPU")
    with (patch.dict(os.environ, env), patch.object(gemm, "_FUSED_QUANT_LOAD_ATTEMPTED", False),
          patch.object(torch.ops, "load_library", wraps=torch.ops.load_library) as load):
        with pytest.raises(RuntimeError, match="already registered"):
            gemm._load_fused_quantizer()
        load.assert_not_called()


@pytest.mark.parametrize('platform', ['win32', 'darwin'])
def test_native_loader_rejects_non_linux_before_load_and_install(tmp_path, platform):
    import hashlib
    import os
    import pytest
    path = tmp_path / 'fixture.so'
    path.write_bytes(b'fixture')
    env = {'K8V4_PREFILL_GEMM': 'w4a8', 'K8V4_W4A8_FUSED_QUANT': '1',
           'K8V4_W4A8_FUSED_QUANT_LIB': str(path),
           'K8V4_W4A8_FUSED_QUANT_SHA256': hashlib.sha256(path.read_bytes()).hexdigest()}
    with (patch.dict(os.environ, env), patch('sys.platform', platform),
          patch.object(gemm, '_RUNTIME_ENABLED', False),
          patch.object(gemm, '_FUSED_QUANT_OP', None),
          patch.object(gemm, '_FUSED_QUANT_LOAD_ATTEMPTED', False),
          patch.object(gemm, 'install') as install,
          patch.object(torch.ops, 'load_library') as load):
        with pytest.raises(RuntimeError, match='Linux'):
            gemm.install_if_requested()
        load.assert_not_called()
        install.assert_not_called()
        assert not gemm._RUNTIME_ENABLED
        assert gemm._FUSED_QUANT_OP is None
        assert not gemm._FUSED_QUANT_LOAD_ATTEMPTED


@pytest.mark.parametrize('location', ['file', 'parent', 'root'])
@pytest.mark.parametrize('defect', ['owner', 'group_write', 'world_write', 'symlink', 'wrong_type'])
def test_native_loader_rejects_untrusted_components_before_install(tmp_path, location, defect):
    import hashlib
    import os
    import stat
    from pathlib import Path
    path = (tmp_path / 'fixture.so').resolve()
    path.write_bytes(b'fixture')
    target = {'file': path, 'parent': path.parent, 'root': path.parents[-1]}[location]
    env = {'K8V4_PREFILL_GEMM': 'w4a8', 'K8V4_W4A8_FUSED_QUANT': '1',
           'K8V4_W4A8_FUSED_QUANT_LIB': str(path),
           'K8V4_W4A8_FUSED_QUANT_SHA256': hashlib.sha256(path.read_bytes()).hexdigest()}
    original = Path.lstat
    def metadata(component):
        info = original(component)
        mode = stat.S_IFMT(info.st_mode) | (0o755 if stat.S_ISDIR(info.st_mode) else 0o644)
        uid = 0
        if component == target:
            if defect == 'owner': uid = 1000
            if defect == 'group_write': mode |= stat.S_IWGRP
            if defect == 'world_write': mode |= stat.S_IWOTH
            if defect == 'symlink': mode = stat.S_IFLNK | 0o777
            if defect == 'wrong_type': mode = (stat.S_IFDIR if location == 'file' else stat.S_IFREG) | 0o644
        return SimpleNamespace(st_uid=uid, st_mode=mode)
    # Windows cannot represent POSIX root ownership and group/world mode bits;
    # emulate Linux lstat metadata while retaining real path resolution/bytes.
    with (patch.dict(os.environ, env), patch('sys.platform', 'linux'),
          patch.object(Path, 'lstat', metadata),
          patch.object(gemm, '_RUNTIME_ENABLED', False),
          patch.object(gemm, '_FUSED_QUANT_OP', None),
          patch.object(gemm, '_FUSED_QUANT_LOAD_ATTEMPTED', False),
          patch.object(gemm, 'install') as install,
          patch.object(torch.ops, 'load_library') as load):
        with pytest.raises(RuntimeError, match='root-owned trusted path'):
            gemm.install_if_requested()
        load.assert_not_called()
        install.assert_not_called()
        assert not gemm._RUNTIME_ENABLED
        assert gemm._FUSED_QUANT_OP is None
        assert not gemm._FUSED_QUANT_LOAD_ATTEMPTED
