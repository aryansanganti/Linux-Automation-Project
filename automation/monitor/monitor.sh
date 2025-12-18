#!/bin/bash

BASE_DIR=$(dirname "$(dirname "$(realpath "$0")")")
LOG="$BASE_DIR/logs/monitor.log"

mkdir -p "$BASE_DIR/logs"

DATE=$(date)
CPU=$(top -bn1 | grep "Cpu" | awk '{print $2}')
DISK=$(df / | tail -1 | awk '{print $5}')
MEM=$(free -m | awk 'NR==2{print $3}')

echo "$DATE | CPU:$CPU% | Disk:$DISK | Memory:${MEM}MB" >> "$LOG"

