#!/bin/bash

# Get desired cores from the user, otherwise default to 2
DESIRED_CORES=${1:-2}
# Get number of cores on this system
CPU_CORES=$(lscpu | grep '^CPU(s):' | awk '{print $2}')
echo "Total CPU Cores: $CPU_CORES"

ONLINE_CORES_BEFORE=$(nproc)
echo "Online CPU Cores (before): $ONLINE_CORES_BEFORE"

# For each core, enable or disable it
for ((i=1; i<$CPU_CORES; i++)); do
  if [ $i -ge $DESIRED_CORES ]; then
    echo 0 > /sys/devices/system/cpu/cpu${i}/online
  else
    echo 1 > /sys/devices/system/cpu/cpu${i}/online
  fi
done

ONLINE_CORES_AFTER=$(nproc)
echo "Online CPU Cores (after): $ONLINE_CORES_AFTER"
