#!/bin/bash

LOG_PATH="/app/miner.log"              # Set correct path
MINER_CMD="bash /app/start.sh"         # Call your actual miner script
CHECK_INTERVAL=60
FAILED_COUNT=0
MAX_FAILS=5

while true; do
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    # 1. Check internet
    ping -c 1 8.8.8.8 > /dev/null
    if [ $? -ne 0 ]; then
        echo "$TIMESTAMP ❌ No internet." >> /app/emergency.log
        sleep $CHECK_INTERVAL
        continue
    fi

    # 2. Check if miner is running
    if ! pgrep -f xmrig > /dev/null; then
        echo "$TIMESTAMP ❌ Miner not running. Restarting..." >> /app/emergency.log
        $MINER_CMD >> "$LOG_PATH" 2>&1 &
        ((FAILED_COUNT++))
    
    # 3. Check for stalled hashrate
    elif tail -n 5 "$LOG_PATH" | grep -Eq "n/a n/a n/a|0.00 0.00 0.00"; then
        echo "$TIMESTAMP ⚠️ Miner stuck. Restarting..." >> /app/emergency.log
        pkill -f xmrig
        sleep 2
        $MINER_CMD >> "$LOG_PATH" 2>&1 &
        ((FAILED_COUNT++))
    
    # 4. Check for system kill
    elif dmesg | tail -n 30 | grep -qi 'killed process'; then
        echo "$TIMESTAMP ⚠️ Miner killed by system. Restarting..." >> /app/emergency.log
        $MINER_CMD >> "$LOG_PATH" 2>&1 &
        ((FAILED_COUNT++))

    else
        echo "$TIMESTAMP ✅ Miner OK." >> /app/emergency.log
        FAILED_COUNT=0
    fi

    if [ $FAILED_COUNT -ge $MAX_FAILS ]; then
        echo "$TIMESTAMP 🔥 Too many failures. Rebooting system..." >> /app/emergency.log
        sudo reboot
    fi

    sleep $CHECK_INTERVAL
done
