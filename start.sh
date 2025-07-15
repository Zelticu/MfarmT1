#!/bin/sh
cd /app/xmrig/build || exit

exec nice -n 19 ./xmrig \
  -o gulf.moneroocean.stream:10128 \
  -u YOUR_MONERO_ADDRESS_HERE \
  --coin monero -p x \
  --threads 1 \
  --cpu-priority 1 \
  --donate-level 1
