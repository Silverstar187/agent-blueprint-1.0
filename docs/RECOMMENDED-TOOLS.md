# Recommended Tools & Stack

> Concrete tool recommendations for OpenClaw agents, ranked by priority.

## 🎯 Core Stack (Tier 1 - Essential)

These tools form the foundation of a production-ready agent:

| Priority | Tool | Purpose | Why |
|:---|:---|:---|:---|
| 1 | **OpenClaw Gateway** | Agent runtime | Core infrastructure |
| 2 | **Git + GitHub** | Version control | Backup, collaboration |
| 3 | **ByteRover/Cipher** | Semantic RAG | Pattern memory, knowledge retrieval |
| 4 | **gh CLI** | GitHub automation | Issues, PRs, repos |
| 5 | **Obsidian** | Knowledge management | Notes, linking, graph view |

## 🔧 Development Tools (Tier 2 - High Value)

| Priority | Tool | Purpose | Best For |
|:---|:---|:---|:---|
| 6 | **Python 3.11+** | Scripting | Automation, data processing |
| 7 | **Node.js 20+** | JavaScript runtime | Web apps, tooling |
| 8 | **Docker** | Containerization | Deployment, isolation |
| 9 | **jq** | JSON processing | CLI data manipulation |
| 10 | **fzf** | Fuzzy finder | File navigation, history |

## 🌐 Web & Data (Tier 3 - Specialized)

| Priority | Tool | Purpose | When To Use |
|:---|:---|:---|:---|
| 11 | **crawl4ai** | Web scraping | Fast markdown extraction |
| 12 | **Apify CLI** | Scraping automation | Login-required sites |
| 13 | **pandoc** | Document conversion | PDF, DOCX processing |
| 14 | **yt-dlp** | Video download | YouTube transcription |
| 15 | **ffmpeg** | Media processing | Audio/video manipulation |

## 🤖 AI/LLM Tools (Tier 4 - Enhancement)

| Priority | Tool | Purpose | Models |
|:---|:---|:---|:---|
| 16 | **OpenRouter** | Model aggregation | Access to multiple providers |
| 17 | **DeepSeek API** | Reasoning | Complex planning |
| 18 | **Gemini API** | Fast inference | Quick tasks, fallback |
| 19 | **Moonshot API** | Balanced | Primary reasoning |
| 20 | **v0.dev** | UI generation | Frontend prototyping |

## 📊 Monitoring & Ops (Tier 5 - Production)

| Priority | Tool | Purpose | Setup |
|:---|:---|:---|:---|
| 21 | **Cron** | Scheduling | Hourly backups, tasks |
| 22 | **systemd** | Service management | Auto-restart, logging |
| 23 | **ufw** | Firewall | Security hardening |
| 24 | **tailscale** | VPN mesh | Secure remote access |
| 25 | **rclone** | Cloud sync | Multi-cloud backups |

## Tool Selection Guide

### For New Agents (Start Here)
```
Essential:  OpenClaw + Git + ByteRover + gh CLI
Add soon:   Python + Docker + Obsidian
Advanced:   Apify + Cron + Tailscale
```

### By Use Case

**Software Development:**
- gh CLI → GitHub automation
- Python/Node → Scripting
- Docker → Deployment
- v0.dev → UI prototyping

**Research & Analysis:**
- ByteRover → Pattern memory
- crawl4ai → Web extraction
- yt-dlp → Video transcription
- pandoc → Document processing

**Business Automation:**
- n8n → Workflow automation
- Apify → Data extraction
- Cron → Scheduled tasks
- Obsidian → Knowledge base

**Infrastructure:**
- Docker → Containerization
- Tailscale → Secure networking
- systemd → Service management
- ufw → Firewall rules

## Installation Quick-Start

### Ubuntu/Debian
```bash
# Tier 1: Essential
sudo apt update
sudo apt install -y git jq python3 python3-pip nodejs npm docker.io

# Tier 2: Development
sudo apt install -y fzf pandoc ffmpeg

# Tier 3: Python tools
pip3 install crawl4ai yt-dlp

# Tier 4: CLI tools
# Install gh CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh
```

### macOS
```bash
# Tier 1: Essential
brew install git gh jq python node docker

# Tier 2: Development
brew install fzf pandoc ffmpeg yt-dlp

# Tier 3: Python
pip3 install crawl4ai

# Tier 4: Tailscale
brew install tailscale
```

## Configuration Priorities

### 1. GitHub CLI (First)
```bash
gh auth login
gh config set git_protocol ssh
```

### 2. ByteRover/Cipher (Second)
```bash
# Configure for semantic search
brv init
brv curate "Your first pattern" -f context.md
```

### 3. Docker (Third)
```bash
sudo usermod -aG docker $USER
# Log out and back in
docker run hello-world
```

### 4. Cron Jobs (Fourth)
```bash
# Edit crontab
crontab -e

# Add hourly backup
0 * * * * /path/to/backup_critical_files.sh
```

## Tool Substitutions

If primary tools unavailable:

| Primary | Alternative | Trade-off |
|:---|:---|:---|
| ByteRover | Custom vector DB | More setup, full control |
| gh CLI | curl + GitHub API | More verbose |
| crawl4ai | BeautifulSoup | Slower, more code |
| Obsidian | VS Code + Markdown | Less linking features |
| Tailscale | WireGuard | Manual config required |

## Anti-Patterns

❌ **Installing everything at once** → Start with Tier 1, add gradually
❌ **Using tools without learning them** → RTFM before production use
❌ **Hardcoding credentials** → Use env vars or secure vaults
❌ **No backup strategy** → Hourly sync minimum
✅ **Document your stack in TOOLS.md** → Future you will thank you

---

*Start with Tier 1. Add tools when you need them, not before.*
