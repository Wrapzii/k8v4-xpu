"""Run the ESIMD dpas layout probe binary mounted at /out/dpas_probe."""
import subprocess
import sys

r = subprocess.run(["/out/dpas_probe"], capture_output=True, text=True)
sys.stdout.write(r.stdout)
sys.stderr.write(r.stderr)
sys.exit(r.returncode)
