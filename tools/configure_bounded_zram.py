"""AI VM-specific migration to bounded zram; requires root and its existing helper.
Backs up the helper, checks drain headroom, and retains existing disk swap.
Run during maintenance; draining swap can be slow under load.
"""
from pathlib import Path
import shutil,subprocess,json
p=Path('/usr/local/sbin/ai01-zram.sh');backup=p.with_name('ai01-zram.before-safety-20261001.sh')
if not backup.exists():shutil.copy2(p,backup)
s=p.read_text();s=s.replace('DISKSIZE=${DISKSIZE:-14G}','DISKSIZE=${DISKSIZE:-4G}').replace('MEMLIMIT=${MEMLIMIT:-3G}','MEMLIMIT=${MEMLIMIT:-0}')
s=s.replace('# mem_limit caps how much real RAM zram may consume; if data compresses badly\n# zram rejects writes and the kernel falls through to /srv/swapfile (prio -1).','# Bound logical capacity instead of rejecting writes at a physical memory cap.\n# An exhausted logical swap device lets the allocator use disk swap normally.')
p.write_text(s);subprocess.run(['bash','-n',str(p)],check=True)
Path('/etc/sysctl.d/99-zzz-ai01-swap-safety.conf').write_text('# Keep reclaim balanced now that disk swap is the overflow path.\nvm.swappiness = 60\n')
subprocess.run(['sysctl','-w','vm.swappiness=60'],check=True)
mem=dict((line.split(':',1)[0],int(line.split()[1])*1024) for line in Path('/proc/meminfo').read_text().splitlines() if len(line.split())>2)
used=int(Path('/sys/block/zram0/mm_stat').read_text().split()[0])
assert mem['MemAvailable']+mem['SwapFree']>used+2*1024**3,'Insufficient headroom to drain zram'
Path('/sys/block/zram0/mem_limit').write_text('0')
print('DRAINING_ZRAM_TO_DISK_SWAP',flush=True)
subprocess.run(['swapoff','/dev/zram0'],check=True)
Path('/sys/block/zram0/reset').write_text('1')
Path('/sys/block/zram0/comp_algorithm').write_text('zstd')
Path('/sys/block/zram0/disksize').write_text(str(4*1024**3))
Path('/sys/block/zram0/mem_limit').write_text('0')
subprocess.run(['mkswap','-U','clear','/dev/zram0'],check=True)
subprocess.run(['swapon','--priority','100','/dev/zram0'],check=True)
print('BOUNDED_ZRAM_ACTIVE',flush=True)
subprocess.run(['swapon','--show'],check=True)
