#!/bin/bash
set -e

SOURCE_DIR="/home/ubuntu/scripts"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
TIMESTAMP=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE="$BACKUP_DIR/practice-scripts_${TIMESTAMP}.tar.gz"

prepare_backup_dir() {
    if [[ ! -d "$BACKUP_DIR" ]]; then
        mkdir -p "$BACKUP_DIR"
        echo "Backup folder bana diya: $BACKUP_DIR"
    fi
}

take_backup() {
    if [[ ! -d "$SOURCE_DIR" ]]; then
        echo "ERROR: Source '$SOURCE_DIR' nahi mila." >&2
        exit 1
    fi
    tar -czf "$ARCHIVE" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
    echo "Backup ban gaya: $ARCHIVE"
    echo "Size: $(du -h "$ARCHIVE" | awk '{print $1}')"
}

cleanup_old_backups() {
    cd "$BACKUP_DIR"
    ls -1t practice-scripts_*.tar.gz 2>/dev/null | tail -n +14 | xargs -r rm -f
    echo "Cleanup done — sirf last 14 backups rakhe gaye."
}

prepare_backup_dir
take_backup
cleanup_old_backups

echo ""
echo "Done. Saare backups:"
ls -lh "$BACKUP_DIR"/practice-scripts_*.tar.gz
