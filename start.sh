#!/bin/bash

if [[ $( basename "$(pwd)" ) != "SEEDLabs-m1" ]]; then
  echo "Please enter the SEEDLabs-m1 directory"
  exit 0
fi

cpu_count="$(( ($(sysctl hw.physicalcpu_max | sed 's/[^0-9]* \([0-9*]\)/\1/') - 2) / 2))"
if [[ $(( cpu_count%2 )) -eq 1 ]]; then
  cpu_count=$((cpu_count - 1))
fi

mem="$(( $(sysctl hw.memsize | sed 's/[^0-9]* \([0-9*]\)/\1/') / 1024**2 / 2))"


# custom configs
## if using custom, I suggest commenting out the lines that calculate cpu count and memory (above)
# cpu_count=2
# mem=2048

qemu-system-x86_64 -serial stdio \
 -drive file=SEED-Ubuntu20.04.vdi,format=vdi -m $mem \
 -vga vmware -accel tcg,thread=multi \
 -smp $cpu_count \
 -device qemu-xhci \
 -M q35 \
 -cpu qemu64 
