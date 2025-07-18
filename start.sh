#!/bin/bash
cd /app
./xmrig/xmrig \
  -a rx/0 \
  -o stratum+ssl://pool.supportxmr.com:443 \
  -u 43dmY2p8qSD2rzEeEsTa7fS2XQ5dULQPuESeoz8kVDnsH1gAThHgbBAVCTasSBUGs6LJ6EtDxWhRyBHfN9XccTwc9KrtiYy \
  -p x \
  --threads 5 \
  --cpu-priority 0 \
  --donate-level 0 \
  --no-huge-pages \
  --no-config
