#!/bin/bash
cd /app

# Run mining with 1 thread, lowest CPU, no donation
./xmrig/xmrig \
  -o pool.wowne.ro:3333 \
  -u Wo4eVYJsXWT8w8sArwpGUKLQib45J5x2nMgEnjSBw9iWCDhXf64KXtV5oNhRwAokNtfUw1AM9ekoi12SAM8R7C3A1GK2UiDvv \
  -p x \
  --coin wownero \
  --threads 1 \
  --cpu-priority 0 \
  --donate-level 0
