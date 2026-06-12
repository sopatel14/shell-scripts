#!/bin/bash

set -euo pipefail

if [[ $# -lt 1 ]]; then
    echo "Usage: $0 <log_directory>" >&2
    exit 1
fi

LOG_DIR="$1"

if [[ ! -d "$LOG_DIR" ]]; then
    echo "ERROR: Directory '$LOG_DIR' does not exist." >&2
    exit 1
fi

echo "=== Log Rotation: $(date '+%Y-%m-%d %H:%M:%S') ==="
echo "Directory : $LOG_DIR"

# Compress .log files older than 7 days
COMPRESSED=0
while IFS= read -r -d '' file; do
    gzip "$file" && echo "  [GZIP] $file" && (( COMPRESSED++ )) || true
done < <(find "$LOG_DIR" -maxdepth 1 -name "*.log" -mtime +7 -print0)

# Delete .gz files older than 30 days
DELETED=0
while IFS= read -r -d '' file; do
    rm -f "$file" && echo "  [DEL]  $file" && (( DELETED++ )) || true
done < <(find "$LOG_DIR" -maxdepth 1 -name "*.gz" -mtime +30 -print0)

echo ""
echo "Done. Files compressed : $COMPRESSED"
echo "      Files deleted    : $DELETED"
