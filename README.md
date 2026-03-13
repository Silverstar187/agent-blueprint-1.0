# 🦞 OpenClaw Agent Blueprint 1.0

> A generic, production-ready agent architecture for OpenClaw. Copy this template, customize 5 files, deploy your own autonomous agent.

## 🚀 Quick Start (5 Minutes)

```bash
# 1. Clone this blueprint
git clone https://github.com/YOURNAME/agent-blueprint.git my-agent
cd my-agent

# 2. Customize the 5 core files (see below)
# 3. Deploy to your OpenClaw instance
# 4. Start the agent
```

## 📁 What You Get

This blueprint contains a **complete agent architecture** based on proven patterns:

| Component | Purpose | Status |
|-----------|---------|--------|
| **Core Identity** | Who the agent is, what it values | Template |
| **Heartbeat System** | Self-directed progress tracking | Template |
| **Memory Architecture** | Three-tier knowledge system | Configured |
| **Tool Inventory** | Available capabilities catalog | Documented |
| **Workflow Patterns** | Subagent orchestration, validation | Guides |
| **Scripts** | Backup, sync, maintenance | Ready-to-use |
| **Skills** | Reusable capability modules | Examples |

## 🎯 The 5 Files You MUST Customize

1. **`SOUL.md`** → Your agent's core values and mission
2. **`IDENTITY.md`** → Name, role, projects, mindset
3. **`HEARTBEAT.md`** → Current priorities and goals
4. **`MEMORY.md`** → Domain-specific learnings
5. **`AGENTS.md`** → Your infrastructure configuration

See `/templates/` for fill-in-the-blank versions.

## 🧠 Architecture Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    AGENT BLUEPRINT 1.0                       │
├─────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌─────────────────────────────────────────────────────┐    │
│  │ TIER 1: CORE IDENTITY (Loaded Every Session)        │    │
│  │  • SOUL.md       → Values, mission, boundaries      │    │
│  │  • IDENTITY.md   → Persona, role, current projects  │    │
│  │  • HEARTBEAT.md  → Active work, blockers, focus     │    │
│  │  • MEMORY.md     → Long-term learnings              │    │
│  │  • TOOLS.md      → Available capabilities           │    │
│  │  • AGENTS.md     → Infrastructure config            │    │
│  └─────────────────────────────────────────────────────┘    │
│                            │                                 │
│  ┌─────────────────────────┴─────────────────────────────┐    │
│  │ TIER 2: SEMANTIC RAG (Searchable Knowledge)           │    │
│  │  • .brv/context-tree/  → Auto-indexed patterns       │    │
│  │  • Ontology graph      → Structured relationships    │    │
│  └─────────────────────────────────────────────────────┘    │
│                            │                                 │
│  ┌─────────────────────────┴─────────────────────────────┐    │
│  │ TIER 3: DAILY CONTEXT (Time-Bound Operations)         │    │
│  │  • memory/YYYY-MM-DD.md → Daily diary               │    │
│  │  • memory/projects/     → Project details           │    │
│  │  • client-repos/        → External work             │    │
│  └─────────────────────────────────────────────────────┘    │
│                                                              │
├─────────────────────────────────────────────────────────────┤
│  OPERATIONAL PRINCIPLES                                      │
│  • 7-Phase Protocol (Analysis → Validation → Persistence)   │
│  • 5-Todo Rule (Max 5 open tasks per work item)             │
│  • Total Recall (Never say "I don't remember")              │
│  • Autonomous Action (Self-directed when blocked)           │
│  • Empirical Proof (Validate with ls/grep/curl/tests)       │
└─────────────────────────────────────────────────────────────┘
```

## 📚 Documentation

| Guide | Purpose |
|-------|---------|
| [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) | How the memory tiers work |
| [`docs/HEARTBEAT.md`](docs/HEARTBEAT.md) | Setting up self-directed progress |
| [`docs/SUBAGENTS.md`](docs/SUBAGENTS.md) | Parallel task orchestration |
| [`docs/TOOLS.md`](docs/TOOLS.md) | Tool categories and triggers |
| [`docs/WORKFLOWS.md`](docs/WORKFLOWS.md) | The 7-Phase Protocol |

## 🛠️ Tools & Skills Included

### Core Tools (Universal Categories)

| Category | Tools | Use When... |
|----------|-------|-------------|
| **File Operations** | `read`, `write`, `edit` | Working with files |
| **Shell** | `exec`, `process` | Running commands |
| **Browser** | `browser` | Web automation |
| **Search** | `web_search`, `web_fetch` | Research |
| **Knowledge** | `memory_search`, `ontology` | Recall patterns |
| **Communication** | `message`, `tts` | External contact |
| **Orchestration** | `sessions_spawn`, `subagents` | Parallel work |

### Skills (Copy from `/skills/examples/`)

| Skill | Purpose |
|-------|---------|
| `skill-creator` | Build new skills |
| `github` | GitHub CLI workflows |
| `obsidian` | Knowledge management |
| `byterover` | Semantic RAG queries |
| `ontology` | Structured knowledge graphs |
| `weather` | Simple utility example |

## 🔄 Daily Workflow

```
1. AGENT STARTS
   └─→ Load Tier 1 (Core Identity)

2. USER INTERACTION or HEARTBEAT
   ├─→ Route memory: Core → Cipher → Daily
   ├─→ Execute: Direct or Subagent
   └─→ Validate: Empirical proof

3. COMPLETION
   ├─→ Update HEARTBEAT.md (if priority changed)
   ├─→ Log to memory/YYYY-MM-DD.md
   └─→ Sync to GitHub (hourly cron)
```

## 🛡️ Safety & Boundaries

- **Privacy**: Internal memory stays in private repo
- **Client Isolation**: External work in `client-repos/`
- **Backup**: Hourly snapshots + GitHub sync
- **Validation**: Every claim needs proof
- **No Silent Failures**: Document everything

## 📂 Repository Structure

```
agent-blueprint/
├── Core Identity (Customize These)
│   ├── SOUL.md
│   ├── IDENTITY.md
│   ├── HEARTBEAT.md
│   ├── MEMORY.md
│   ├── TOOLS.md
│   └── AGENTS.md
│
├── templates/               # Fill-in-the-blank versions
│   ├── SOUL.md.template
│   ├── IDENTITY.md.template
│   └── ...
│
├── docs/                    # Documentation
│   ├── ARCHITECTURE.md
│   ├── HEARTBEAT.md
│   ├── SUBAGENTS.md
│   ├── TOOLS.md
│   └── WORKFLOWS.md
│
├── scripts/                 # Utility scripts
│   ├── backup_critical_files.sh
│   ├── checkpoint.sh
│   ├── sync_to_github.sh
│   └── setup.sh            # One-time setup
│
├── skills/                  # Skill examples
│   └── examples/
│       ├── github/
│       ├── obsidian/
│       └── ...
│
├── memory/                  # Daily context (gitignored template)
│   └── .gitkeep
│
├── .brv/                    # Semantic RAG (gitignored template)
│   └── context-tree/
│       └── .gitkeep
│
├── .github/
│   └── workflows/
│       └── sync.yml         # Auto-sync to GitHub
│
├── .gitignore
├── LICENSE
└── README.md               # This file
```

## 🎓 Customization Guide

### Step 1: Identity (SOUL.md)

Define your agent's essence:

```markdown
## Core Truths
- **Mission:** [Single sentence purpose]
- **Vibe:** [3-4 adjectives]
- **Boundaries:** [What it won't do]

## The 1% Rule
> "Daily improvement compounds exponentially"
```

### Step 2: Persona (IDENTITY.md)

```markdown
- **Name:** [Human name] / [Codename]
- **Role:** [Job title] @ [Organization]
- **Core Projects:**
  1. [Project 1]
  2. [Project 2]
  3. [Project 3]
```

### Step 3: Current Focus (HEARTBEAT.md)

```markdown
## 🎯 FINAL GOAL
**[Measurable objective]?** [Status] | **DEADLINE:** [Date]

## 🔥 TODAY'S FOCUS
**Today:** [Single priority]
**Why:** [Business justification]

## 🚧 Active Blockers
| Blocker | Since | Next Step |
```

### Step 4: Capabilities (TOOLS.md)

Document YOUR specific tools:

```markdown
## Available Tools
- **Primary Model:** [Your model]
- **GitHub:** [Your org/repos]
- **APIs:** [Your credentials]
```

### Step 5: Infrastructure (AGENTS.md)

```markdown
## Deployment
- **Provider:** [VPS/Cloud]
- **Container:** [Name]
- **SSH:** [Access details]
```

## 🚦 Health Checks

Verify your agent is healthy:

```bash
# Check memory system
ls -la ~/.openclaw/workspace/memory/

# Test semantic search
brv query "test"

# Verify Git sync
git status

# Check heartbeat
cat ~/.openclaw/workspace/HEARTBEAT.md
```

## 🤝 Contributing

This blueprint improves through use. If you develop:
- New skill patterns
- Better workflows
- Additional templates

Consider contributing back!

## 📜 License

MIT License - Use freely, customize fully.

---

**Ready to deploy?** Start with `templates/SOUL.md.template` → [Customize in 5 min](templates/SOUL.md.template)

*Built by the OpenClaw community. Inspired by real-world agent patterns.*
