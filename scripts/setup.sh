#!/bin/bash
# setup.sh - One-time setup for new agent from blueprint

set -e

echo "🦞 Agent Blueprint 1.0 - Setup"
echo "=============================="

# Check workspace
WORKSPACE_DIR="${1:-$HOME/.openclaw/workspace}"
if [ ! -d "$WORKSPACE_DIR" ]; then
    echo "Creating workspace directory..."
    mkdir -p "$WORKSPACE_DIR"
fi

cd "$WORKSPACE_DIR"

# Copy templates
echo ""
echo "📋 Step 1: Copy templates"
echo "-------------------------"
echo "Copy template files and customize them:"
echo ""
echo "  cp templates/SOUL.md.template ./SOUL.md"
echo "  cp templates/IDENTITY.md.template ./IDENTITY.md"
echo "  cp templates/HEARTBEAT.md.template ./HEARTBEAT.md"
echo "  cp templates/MEMORY.md.template ./MEMORY.md"
echo "  cp templates/TOOLS.md.template ./TOOLS.md"
echo "  cp templates/AGENTS.md.template ./AGENTS.md"
echo ""
echo "Then edit each file to customize for your agent."

# Create directories
echo ""
echo "📁 Step 2: Create directory structure"
echo "-------------------------------------"
mkdir -p memory/projects memory/research .brv/context-tree client-repos
echo "✓ Created: memory/"
echo "✓ Created: .brv/context-tree/"
echo "✓ Created: client-repos/"

# Initialize git
echo ""
echo "🔄 Step 3: Initialize git"
echo "-------------------------"
if [ ! -d ".git" ]; then
    git init
    git config user.email "agent@localhost"
    git config user.name "Agent"
    echo "✓ Git initialized"
else
    echo "ℹ️ Git already initialized"
fi

# Create .gitignore
echo ""
echo "🚫 Step 4: Create .gitignore"
echo "----------------------------"
cat > .gitignore << 'EOF'
# Dependencies
node_modules/
venv/
.venv/
__pycache__/

# Media files
*.mp3
*.wav
*.png
*.jpg
*.jpeg
*.gif
*.zip
*.tar.gz

# Data files
*.csv
*.log
.DS_Store

# Secrets
.env
secrets/
config.json

# Large binaries
*.pdf
*.docx
EOF
echo "✓ .gitignore created"

# Setup cron (optional)
echo ""
echo "⏰ Step 5: Setup automated sync (optional)"
echo "-------------------------------------------"
echo "To enable hourly backups, run:"
echo ""
echo "  crontab -e"
echo ""
echo "Add this line:"
echo "  0 * * * * $WORKSPACE_DIR/scripts/backup_critical_files.sh"
echo ""
echo "For GitHub sync:"
echo "  0 * * * * cd $WORKSPACE_DIR && ./scripts/sync_to_github.sh"

# Final message
echo ""
echo "✅ Setup complete!"
echo "=================="
echo ""
echo "Next steps:"
echo "1. Customize SOUL.md with your agent's values"
echo "2. Fill out IDENTITY.md with name and role"
echo "3. Set initial priorities in HEARTBEAT.md"
echo "4. Document your tools in TOOLS.md"
echo "5. Configure infrastructure in AGENTS.md"
echo ""
echo "Start with: nano SOUL.md"
echo ""
echo "📚 Documentation: docs/"
echo "🎨 Templates: templates/"
echo "⚙️  Scripts: scripts/"
