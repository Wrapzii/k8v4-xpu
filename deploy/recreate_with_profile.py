#!/usr/bin/env python3
"""Recreate vllm-k8v4-tp2 from its own `docker inspect`, changing only:
  * /opt/k8v4-casc mount source -> the staged attn-profile package
  * + bind mount ~/ops/vllm-telemetry/attn-profile -> /ops/attn-profile (rw)
  * + env VLLM_K8V4_PROFILE=1, VLLM_K8V4_PROFILE_SAMPLE=<rate>, VLLM_K8V4_PROFILE_DIR=/ops/attn-profile
Same image, same args, same devices/ports. Default is a dry run that prints the
command with env VALUES masked. --apply needs Daniel's OK: it stops the live
container (renamed to a backup, not deleted) and starts the new one.
  --off   same recreate but VLLM_K8V4_PROFILE=0 (for the overhead A/B baseline)
"""
import argparse, json, os, shlex, subprocess, sys, time, urllib.request

NAME = "vllm-k8v4-tp2"
STAGED = "/mnt/hdd-500gb/model-validation/launch80-20261013/perf-attnprof-20261104/k8v4-opt"
OUTDIR = os.path.expanduser("~/ops/vllm-telemetry/attn-profile")


def build(info, rate, on, gmu=None):
    c, h = info["Config"], info["HostConfig"]
    a = ["docker", "run", "-d", "--name", NAME]
    rp = h.get("RestartPolicy") or {}
    if rp.get("Name"):
        a += ["--restart", rp["Name"]]
    if h.get("IpcMode"):
        a.append("--ipc=" + h["IpcMode"])
    if h.get("ShmSize"):
        a.append("--shm-size=%d" % h["ShmSize"])
    for s in h.get("SecurityOpt") or []:
        a += ["--security-opt", s]
    if h.get("NetworkMode"):
        a += ["--network", h["NetworkMode"]]
    for g in h.get("GroupAdd") or []:
        a += ["--group-add", g]
    for d in h.get("Devices") or []:
        a += ["--device", "%s:%s:%s" % (d["PathOnHost"], d["PathInContainer"], d["CgroupPermissions"])]
    for port, binds in (h.get("PortBindings") or {}).items():
        for b in binds or []:
            ip = b.get("HostIp")
            a += ["-p", ("%s:" % ip if ip else "") + "%s:%s" % (b["HostPort"], port.split("/")[0])]
    swapped = False
    for bnd in h.get("Binds") or []:
        parts = bnd.split(":")
        if len(parts) >= 2 and parts[1] == "/opt/k8v4-casc":
            parts[0] = STAGED; swapped = True
        a += ["-v", ":".join(parts)]
    if not swapped:
        sys.exit("live container has no /opt/k8v4-casc bind; refusing")
    a += ["-v", "%s:/ops/attn-profile:rw" % OUTDIR]
    env = [e for e in c.get("Env") or [] if not e.startswith("VLLM_K8V4_PROFILE")]
    env += ["VLLM_K8V4_PROFILE=%s" % ("1" if on else "0"), "VLLM_K8V4_PROFILE_SAMPLE=%s" % rate,
            "VLLM_K8V4_PROFILE_DIR=/ops/attn-profile"]
    for e in env:
        a += ["-e", e]
    if c.get("Entrypoint"):
        a += ["--entrypoint", c["Entrypoint"][0]]
    a.append(c["Image"])
    cmd = list(c.get("Cmd") or [])
    if gmu:
        n = sum(x.startswith("--gpu-memory-utilization=") for x in cmd)
        if n != 1:
            sys.exit("expected one --gpu-memory-utilization= arg, found %d" % n)
        cmd = ["--gpu-memory-utilization=%s" % gmu if x.startswith("--gpu-memory-utilization=") else x for x in cmd]
    a += (c["Entrypoint"][1:] if c.get("Entrypoint") else []) + cmd
    return a


def masked(a):
    out, i = [], 0
    while i < len(a):
        if a[i] == "-e" and i + 1 < len(a):
            k = a[i + 1].split("=", 1)[0]
            out += ["-e", a[i + 1] if k.startswith(("VLLM_K8V4_PROFILE", "XE2_", "K8V4_")) else k + "=***"]
            i += 2
        else:
            out.append(a[i]); i += 1
    return " ".join(shlex.quote(x) for x in out)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--rate", default="0.01")
    ap.add_argument("--off", action="store_true")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--gmu", default=None, help="override --gpu-memory-utilization")
    ap.add_argument("--backup-tag", default="before-attnprof")
    ap.add_argument("--health-timeout", type=int, default=1800)
    o = ap.parse_args()
    info = json.loads(subprocess.check_output(["docker", "inspect", NAME]))[0]
    if not os.path.isdir(STAGED + "/k8v4_v030"):
        sys.exit("run deploy/stage.sh first")
    os.makedirs(OUTDIR, exist_ok=True)
    cmd = build(info, o.rate, not o.off, o.gmu)
    print(masked(cmd))
    if not o.apply:
        print("\n(dry run; nothing changed)"); return
    bak = "%s-%s-%s" % (NAME, o.backup_tag, time.strftime("%Y%m%dT%H%M%S"))
    subprocess.check_call(["docker", "stop", "-t", "30", NAME])
    subprocess.check_call(["docker", "rename", NAME, bak])
    subprocess.check_call(["docker", "update", "--restart=no", bak])
    subprocess.check_call(cmd, stdout=subprocess.DEVNULL)
    print("backup container:", bak, "(rollback: deploy/rollback.sh %s)" % bak)
    for _ in range(o.health_timeout // 10):
        try:
            if b'"object":"list"' in urllib.request.urlopen("http://127.0.0.1:8100/v1/models", timeout=5).read():
                print("healthy"); return
        except Exception:
            pass
        time.sleep(10)
    sys.exit("not healthy after 30 min; consider rollback")


if __name__ == "__main__":
    main()
