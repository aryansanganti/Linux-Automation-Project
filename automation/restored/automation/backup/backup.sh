#!/bin/bash

SOURCE="/automation"
DEST="/automation/backup"
LOG="/automation/logs/backup.log"
DATE=$(date +%F_%H-%M)

tar -czf $DEST/backup_$DATE.tar.gz $SOURCE 2>>$LOG

find $DEST -type f -mtime +7 -delete

echo "Backup completed at $DATE" >> $LOG

