"""Load the uniform-spec scheduler wrap when this directory is on PYTHONPATH.

The container sets PYTHONPATH=/opt/k8v4-qsa:... and bind-mounts this
directory there. Python imports sitecustomize at startup, including
EngineCore, before the first Scheduler.schedule. The stdlib apport hook
is still run when this file is the one Python finds first.
"""

import importlib.util
from pathlib import Path

_SYSTEM = Path("/usr/lib/python3.12/sitecustomize.py")
if _SYSTEM.is_file():
    _spec = importlib.util.spec_from_file_location("_k8v4_system_sitecustomize", _SYSTEM)
    if _spec is not None and _spec.loader is not None:
        _mod = importlib.util.module_from_spec(_spec)
        _spec.loader.exec_module(_mod)

from k8v4_v030.uniform_spec import install_if_vllm_present
from k8v4_v030.qsa_width import install_if_vllm_present as install_qsa_width

install_if_vllm_present()
install_qsa_width()
