#!/bin/bash

BASE_DIR=$(dirname "$(dirname "$(realpath "$0")")")

BACKUP_FILE=$1
RESTORE_DIR="$BASE_DIR/restored"
LOG="$BASE_DIR/logs/recovery.log"

mkdir -p "$RESTORE_DIR"
mkdir -p "$BASE_DIR/logs"

if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: ./restore.sh <backup-file>" | tee -a "$LOG"
  exit 1
fi

if [ ! -f "$BACKUP_FILE" ]; then
  echo "Backup file not found: $BACKUP_FILE" | tee -a "$LOG"
  exit 1
fi

tar -xzf "$BACKUP_FILE" -C "$RESTORE_DIR"

echo "$(date) | Recovery completed from $BACKUP_FILE" >> "$LOG"

