#!/bin/bash

LOG_PATH="/path/to/miner.log"     # <- Set your miner log path here
MINER_CMD="./start_miner.sh"      # <- Your command to start the miner
CHECK_INTERVAL=60                 # seconds between checks
FAILED_COUNT=0
MAX_FAILS=5

while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    # 1. Check internet
    ping -c 1 8.8.8.8 > /dev/null
    if [ $? -ne 0 ]; then
        echo "$TIMESTAMP ❌ No internet." >> emergency.log
        sleep $CHECK_INTERVAL
        continue
    fi

    # 2. Check if miner is running
    if ! pgrep -f miner > /dev/null; then
        echo "$TIMESTAMP ❌ Miner not running. Restarting..." >> emergency.log
        $MINER_CMD
        ((FAILED_COUNT++))
    # 3. Check for stalled output (n/a or 0.00)
    elif tail -n 5 "$LOG_PATH" | grep -Eq "n/a n/a n/a|0.00 0.00 0.00"; then
        echo "$TIMESTAMP ⚠️ Miner stuck (n/a or 0.00). Restarting..." >> emergency.log
        pkill -f miner
        sleep 2
        $MINER_CMD
        ((FAILED_COUNT++))
    else
        echo "$TIMESTAMP ✅ Miner OK." >> emergency.log
        FAILED_COUNT=0
    fi

    # 4. Too many failures? Reboot
    if [ $FAILED_COUNT -ge $MAX_FAILS ]; then
        echo "$TIMESTAMP 🔥 Too many failures. Rebooting system..." >> emergency.log
        sudo reboot
    fi

    sleep $CHECK_INTERVAL
done
