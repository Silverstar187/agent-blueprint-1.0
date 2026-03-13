#!/bin/bash
# sync_to_github.sh - Sync workspace to private GitHub repo

WORKSPACE_DIR="$HOME/.openclaw/workspace"
cd "$WORKSPACE_DIR" || exit 1

# Check if remote is configured
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "❌ No remote configured. Set up with:"
    echo "   git remote add origin https://github.com/YOURNAME/agent-memory.git"
    exit 1
fi

# Stage all changes
git add .

# Commit (ignore if no changes)
git commit -m "Sync: $(date +'%Y-%m-%d %H:%M:%S')" || true

# Push to remote
echo "Pushing to GitHub..."
if git push origin master --force; then
    echo "✅ Sync complete: $(date)"
else
    echo "❌ Push failed. Check credentials and remote."
    exit 1
fi
