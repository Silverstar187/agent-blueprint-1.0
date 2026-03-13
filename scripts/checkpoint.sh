#!/bin/bash
# checkpoint.sh - Create local git snapshot

WORKSPACE_DIR="$HOME/.openclaw/workspace"
cd "$WORKSPACE_DIR" || exit 1

# Get commit message
MESSAGE="${1:-"Checkpoint: $(date +'%Y-%m-%d %H:%M:%S')"}"

# Initialize git if needed
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git config user.email "agent@localhost"
    git config user.name "Agent"
fi

# Stage all changes
git add .

# Check if there are changes
if ! git diff-index --quiet HEAD -- 2>/dev/null; then
    git commit -m "$MESSAGE"
    echo "✅ Checkpoint created: $MESSAGE"
    echo "Commit: $(git rev-parse --short HEAD)"
else
    echo "ℹ️ No changes since last checkpoint."
fi
