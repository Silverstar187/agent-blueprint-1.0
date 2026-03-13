# Skills Library

> Generic skills that extend agent capabilities. Copy from this list to your `skills/` directory.

## Core Skills (Must-Have)

### skill-creator
**Purpose:** Create, edit, and audit AgentSkills  
**Triggers:** "create a skill", "improve this skill", "audit skill"  
**Location:** `/app/skills/skill-creator/`  
**Files:** SKILL.md, scripts/init_skill.py, scripts/package_skill.py

**What it does:**
- Initializes new skills with proper structure
- Validates SKILL.md format
- Packages skills for distribution
- Audits existing skills

**Usage:**
```bash
# Create new skill
/app/skills/skill-creator/scripts/init_skill.py my-skill --path skills/

# Package skill
/app/skills/skill-creator/scripts/package_skill.py skills/my-skill
```

---

### github
**Purpose:** GitHub CLI workflows  
**Triggers:** "GitHub issues", "create PR", "check CI"  
**Location:** `~/.openclaw/workspace/skills/github/`  

**Key Commands:**
```bash
gh issue list --repo owner/repo
gh pr create --title "Fix bug" --body "Description"
gh run list --repo owner/repo
```

---

## Knowledge Management Skills

### byterover
**Purpose:** Semantic RAG with ByteRover/Cipher  
**Triggers:** "remember", "what do I know about", "find pattern"  
**Location:** `~/.openclaw/workspace/skills/byterover/`

**Core Commands:**
```bash
brv query "authentication pattern"
brv curate "New pattern description" -f src/file.ts
brv index --auto
```

**Why use it:**
- Prevents error loops
- Shares context across projects
- Auto-indexes project files

---

### ontology
**Purpose:** Structured knowledge graphs  
**Triggers:** "remember", "link X to Y", "entity", "dependencies"  
**Location:** `~/.openclaw/workspace/skills/ontology/`

**Entity Types:**
- Person, Project, Task, Event, Document

**Example:**
```bash
python3 skills/ontology/scripts/ontology.py create \
  --type Task \
  --props '{"title":"Deploy API","status":"open"}'
```

---

### obsidian
**Purpose:** Obsidian vault automation  
**Triggers:** "obsidian note", "vault", "markdown note"  
**Location:** `~/.openclaw/workspace/skills/obsidian/`

**Usage:**
```bash
obsidian-cli create "Path/Note" --content "..."
obsidian-cli list
obsidian-cli search "query"
```

---

## Automation Skills

### n8n-workflow-automation
**Purpose:** Design robust n8n workflows  
**Triggers:** "n8n", "workflow automation", "automation"  
**Location:** `~/.openclaw/workspace/skills/n8n-workflow-automation/`

**Features:**
- Idempotency patterns
- Error handling
- Human-in-the-loop review queues
- Retry logic

---

### proactive-agent-lite
**Purpose:** Transform agents into proactive partners  
**Triggers:** "proactive", "self-improving", "autonomous"  
**Location:** `~/.openclaw/workspace/skills/proactive-agent-lite/`

**Patterns:**
- Memory architecture
- Reverse prompting
- Self-healing

---

## Utility Skills

### weather
**Purpose:** Weather info via wttr.in  
**Triggers:** "weather", "temperature", "forecast"  
**Location:** `/app/skills/weather/`

**Usage:**
```bash
# Requires no API key
curl wttr.in/Berlin
```

---

### humanizer
**Purpose:** Humanize AI-generated text  
**Triggers:** "humanize", "de-AI", "natural text"  
**Location:** `~/.openclaw/workspace/skills/ai-humanizer/`

**What it detects:**
- AI vocabulary patterns (500+ terms)
- Statistical analysis (burstiness, TTR)
- 24 pattern detectors

---

### goals
**Purpose:** Trello goal management  
**Triggers:** "trello", "goals", "objectives"  
**Location:** `/app/skills/goals/`

**Integration:**
- Trello boards
- Card management
- Priority tracking

---

## Security & Infrastructure

### healthcheck
**Purpose:** Security hardening for OpenClaw deployments  
**Triggers:** "security audit", "firewall", "updates", "hardening"  
**Location:** `/app/skills/healthcheck/`

**Covers:**
- SSH hardening
- Firewall (UFW) rules
- Automatic updates
- Risk tolerance configuration

---

### 1password
**Purpose:** Secret management via 1Password CLI  
**Triggers:** "secret", "credential", "API key", "password"  
**Location:** `/app/skills/1password/`

**Security:**
- Secure credential storage
- API key management
- No hardcoded secrets

---

## Voice & Communication

### voice-call
**Purpose:** Phone calls via voice-call plugin  
**Triggers:** "call", "phone", "voice conversation"  
**Location:** `/app/skills/voice-call/`

**Note:** Requires voice-call plugin configuration

---

## Skill Installation Guide

### From OpenClaw Marketplace
```bash
# Skills are auto-loaded from:
/app/skills/
~/.openclaw/workspace/skills/
```

### Manual Installation
```bash
# 1. Clone or copy skill to skills/
cp -r /path/to/skill ~/.openclaw/workspace/skills/

# 2. Verify SKILL.md exists
ls ~/.openclaw/workspace/skills/my-skill/SKILL.md

# 3. Test trigger
# (Skill will auto-load on next agent start)
```

### Creating Custom Skills
```bash
# Use skill-creator
/app/skills/skill-creator/scripts/init_skill.py my-skill \
  --path ~/.openclaw/workspace/skills/ \
  --resources scripts,references

# Edit SKILL.md
# Add resources to scripts/, references/, assets/
# Package when ready
/app/skills/skill-creator/scripts/package_skill.py \
  ~/.openclaw/workspace/skills/my-skill
```

## Skill Structure Template

Every skill follows this structure:

```
skill-name/
├── SKILL.md              # Required: Usage instructions
├── scripts/              # Optional: Executable code
│   └── helper.py
├── references/           # Optional: Documentation
│   └── api-docs.md
└── assets/               # Optional: Templates
    └── template.json
```

**SKILL.md frontmatter:**
```yaml
---
name: skill-name
description: "When to use this skill..."
---
```

## Skill Priority Recommendations

### For New Agents (Install Order)
1. **skill-creator** - To build more skills
2. **github** - Essential for code workflows
3. **byterover** - For pattern memory
4. **obsidian** - For knowledge management
5. **healthcheck** - For security

### By Domain

**Software Development:**
- github, skill-creator, byterover

**Research:**
- byterover, ontology, obsidian

**Business:**
- goals, n8n-workflow-automation, 1password

**Infrastructure:**
- healthcheck, 1password, proactive-agent-lite

---

*Skills extend your capabilities. Start with 3-5 core skills, add as needed.*
