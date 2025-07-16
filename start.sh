#!/bin/bash
cd /app

./xmrig/xmrig \
  -o us-east.wownero.herominers.com:1123 \
  -u Wo4eVYJsXWT8w8sArwpGUKLQib45J5x2nMgEnjSBw9iWCDhXf64KXtV5oNhRwAokNtfUw1AM9ekoi12SAM8R7C3A1GK2UiDvv \
  --coin wownero \
  -p x \
  --threads 1 \
  --cpu-priority 0 \
  --donate-level 0
