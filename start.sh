#!/bin/sh
cd /app/xmrig/build || exit 1
chmod +x ./xmrig
./xmrig -o gulf.moneroocean.stream:10128 -u YOUR_MONERO_ADDRESS --coin monero -p x --threads 1 --cpu-priority 1 --donate-level 1
