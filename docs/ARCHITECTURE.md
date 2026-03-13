# Three-Tier Memory Architecture

> How the agent's knowledge system works and why it matters.

## Overview

The Agent Blueprint uses a **three-tier memory system** designed for efficiency, searchability, and persistence:

```
┌─────────────────────────────────────────────────────────────┐
│  TIER 1: CORE IDENTITY                                      │
│  (SOUL, IDENTITY, HEARTBEAT, MEMORY, TOOLS, AGENTS)         │
│  → Loaded every session, defines who the agent is          │
├─────────────────────────────────────────────────────────────┤
│  TIER 2: SEMANTIC RAG                                       │
│  (.brv/context-tree/ or vector DB)                          │
│  → Auto-indexed, searchable knowledge                       │
├─────────────────────────────────────────────────────────────┤
│  TIER 3: DAILY CONTEXT                                      │
│  (memory/, projects/, skills/)                              │
│  → Time-bound, project-specific, operational                │
└─────────────────────────────────────────────────────────────┘
```

## Tier 1: Core Identity

**Purpose:** Define who the agent is, what it values, and how it operates.

### Files

| File | Purpose | Update Frequency |
|:---|:---|:---|
| `SOUL.md` | Essence, values, non-negotiables | Quarterly |
| `IDENTITY.md` | Persona, role, current mission | Monthly |
| `HEARTBEAT.md` | Active work, blockers, next actions | Daily |
| `MEMORY.md` | Long-term learnings, patterns | Weekly |
| `TOOLS.md` | Available capabilities | As needed |
| `AGENTS.md` | Infrastructure, deployment | As needed |

### Characteristics
- Loaded into context at **every session start**
- Defines the agent's "personality" and operational style
- Should be concise to avoid context bloat
- Changes infrequently (foundation, not operations)

## Tier 2: Semantic RAG

**Purpose:** Searchable, auto-indexed knowledge for pattern matching and context retrieval.

### Implementation

**ByteRover Cipher Pattern:**
```
.brv/context-tree/
├── _index.md              # Root summary
├── _manifest.json         # Auto-generated index
├── projects/              # Domain: projects
│   ├── _index.md
│   └── [project]/
├── skills/                # Domain: skills
│   └── [skill]/
└── patterns/              # Domain: reusable patterns
```

### Characteristics
- **Semantic search** via `brv query "your question"`
- **Auto-indexed** when files change
- **Curated** for important patterns and decisions
- **Cross-project** knowledge sharing

### Usage Pattern
```bash
# Before work: Query existing knowledge
brv query "How do I handle authentication?"

# After work: Save new patterns
brv curate "Auth pattern: JWT with 24h expiry" -f src/auth.ts
```

## Tier 3: Daily Context

**Purpose:** Time-bound, operational data specific to current work.

### Structure
```
memory/
├── YYYY-MM-DD.md              # Daily diary
├── YYYY-MM-DD_[event].md      # Specific event logs
├── projects/
│   └── [project-name]/
│       └── _index.md
├── research/
│   └── [topic]_research.md
└── client-repos/              # External work (separate repos)
```

### Characteristics
- **Time-bound:** Files organized by date
- **Operational:** Active work, not patterns
- **Project-specific:** Details for current initiatives
- **Client-isolated:** External work separated

### Daily Diary Template
```markdown
# Memory Log - YYYY-MM-DD

## 📅 Status
- **Time**: HH:MM UTC
- **Vibe**: [Current mode]
- **Focus**: [Primary focus]

## ✅ Completed
- [x] Task 1
- [x] Task 2

## 🧠 Insights
- Learning 1
- Learning 2

## 🚀 Next Steps
1. Next action 1
2. Next action 2
```

## Memory Retrieval Strategy

**The Golden Rule:** *Never say "I don't remember"*

Always route through the tree:

```
1. CORE FIRST (Already loaded)
   └─ SOUL/IDENTITY/HEARTBEAT
   
2. CIPHER SECOND (Semantic search)
   └─ brv query "..."
   
3. DAILY THIRD (File system)
   └─ memory_search / read files
```

## When to Use Each Tier

| Scenario | Tier | Tool/Method |
|:---|:---|:---|
| "What are my core values?" | Core | Already in context |
| "How did we solve X before?" | RAG | `brv query "X"` |
| "What did I do yesterday?" | Daily | Read `memory/YYYY-MM-DD.md` |
| "What are my current blockers?" | Core | Read `HEARTBEAT.md` |
| "What's the pattern for Y?" | RAG | `brv query "Y pattern"` |
| "What did client Z say?" | Daily | `memory_search` or grep |

## Best Practices

### 1. Document, Don't Memorize
- Everything goes in files
- Never rely on "mental notes"
- If it's not written, it doesn't exist

### 2. Structure is Sanity
- Use consistent naming conventions
- Organize by date, project, domain
- Create `_index.md` files for navigation

### 3. Daily Reflection
- Write to `memory/YYYY-MM-DD.md` every day
- Document what worked, what failed, what you learned
- This compounds knowledge over time

### 4. Progressive Disclosure
- Core files: Keep concise
- RAG files: Detailed but searchable
- Daily files: Comprehensive but time-bound

### 5. Client Isolation
- Internal memory → Private repo
- Client work → `client-repos/` (separate repos)
- Never mix internal thoughts with external deliverables

## Implementation Checklist

- [ ] Set up `.brv/context-tree/` directory structure
- [ ] Configure `brv` CLI for semantic search
- [ ] Create `memory/` directory with subfolders
- [ ] Establish daily diary habit
- [ ] Set up automated GitHub sync (hourly cron)
- [ ] Create project index templates
- [ ] Document your naming conventions

## Domain Adaptations

| Domain | Tier 1 Focus | Tier 2 Focus | Tier 3 Focus |
|:---|:---|:---|:---|
| **Software Dev** | Code quality, testing | API patterns, architecture | Sprint tasks, PRs |
| **Research** | Truth-seeking | Papers, sources, methods | Hypotheses, findings |
| **Business** | Revenue, growth | Market data, leads | Deals, metrics, calls |
| **Creative** | Artistic vision | References, styles | Drafts, iterations |
| **Personal** | Life goals | Health, finance data | Habits, reflections |

---

*The memory architecture enables agents to learn, adapt, and improve over time. Use it well.*
