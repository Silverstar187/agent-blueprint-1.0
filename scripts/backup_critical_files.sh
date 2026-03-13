#!/bin/bash
# backup_critical_files.sh - Hourly backup of critical agent files

BACKUP_DIR="$HOME/.openclaw/backups/hourly"
WORKSPACE_DIR="$HOME/.openclaw/workspace"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Files that MUST be backed up
FILES=(
    "SOUL.md"
    "IDENTITY.md"
    "HEARTBEAT.md"
    "MEMORY.md"
    "AGENTS.md"
    "TOOLS.md"
)

# Create backup directory
mkdir -p "$BACKUP_DIR/$TIMESTAMP"

# Backup each file
for FILE in "${FILES[@]}"; do
    if [ -f "$WORKSPACE_DIR/$FILE" ]; then
        cp "$WORKSPACE_DIR/$FILE" "$BACKUP_DIR/$TIMESTAMP/"
        echo "✓ Backed up: $FILE"
    else
        echo "✗ Missing: $FILE"
    fi
done

# Keep only last 24 backups
echo "Cleaning old backups..."
ls -dt "$BACKUP_DIR"/*/ 2>/dev/null | tail -n +25 | xargs -r rm -rf

echo "✅ Backup complete: $BACKUP_DIR/$TIMESTAMP"
echo "Backups retained: $(ls -1 "$BACKUP_DIR" | wc -l)"
