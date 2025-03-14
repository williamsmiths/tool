#!/bin/bash

# Timestamp for backup file
backup_file="/path/to/backup/directory/backup_$(date +%Y%m%d%H%M%S).sql"

# Run pg_dump to backup the database
docker exec postgres-dev pg_dump -U shms -d postgres > "$backup_file"

# Optionally compress the backup file
gzip "$backup_file"

# Cleanup older backup files (optional)
# find /path/to/backup/directory -type f -name 'backup_*.sql.gz' -mtime +7 -exec rm {} \;