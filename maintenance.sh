#!/bin/bash

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_DIR="${LOG_DIR:-/var/log/myapp}"
SOURCE_DIR="${SOURCE_DIR:-/home/ubuntu/scripts}"
BACKUP_DIR="${BACKUP_DIR:-$HOME/shell-backups}"
MAINTENANCE_LOG="/var/log/maintenance.log"

if [[ ! -w /var/log ]]; then
    MAINTENANCE_LOG="$HOME/maintenance.log"
fi

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $*" | tee -a "$MAINTENANCE_LOG"
}

run_log_rotation() {
    log "--- Log Rotation START ---"
    if bash "$SCRIPT_DIR/log_rotate.sh" "$LOG_DIR" >> "$MAINTENANCE_LOG" 2>&1; then
        log "--- Log Rotation OK ---"
    else
        log "--- Log Rotation FAILED (exit $?) ---"
    fi
}

run_backup() {
    log "--- Backup START ---"
    if bash "$SCRIPT_DIR/backup.sh" "$SOURCE_DIR" "$BACKUP_DIR" >> "$MAINTENANCE_LOG" 2>&1; then
        log "--- Backup OK ---"
    else
        log "--- Backup FAILED (exit $?) ---"
    fi
}

log "====== Maintenance job started ======"
run_log_rotation
run_backup
log "====== Maintenance job complete ======"
