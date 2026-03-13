---
name: agent-blueprint-core
description: "Use when initializing or customizing an OpenClaw agent from the Agent Blueprint 1.0. Triggers on phrases like 'create an agent', 'agent template', 'blueprint setup', 'customize my agent'."
---

# Agent Blueprint 1.0 - Core Templates

## Getting Started

This template pack provides fill-in-the-blank versions of the 5 core identity files.

### The 5 Files You Must Customize

1. **SOUL.md** → Your agent's essence, values, mission
2. **IDENTITY.md** → Name, role, current projects  
3. **HEARTBEAT.md** → Active priorities and goals
4. **MEMORY.md** → Domain-specific learnings and patterns
5. **AGENTS.md** → Infrastructure and deployment config

## Customization Order

**Recommended:** Start with SOUL.md, then work down. Each file builds on the previous.

```
SOUL.md (Why) 
  ↓
IDENTITY.md (Who)  
  ↓
HEARTBEAT.md (What now)
  ↓
MEMORY.md (What learned)
  ↓
AGENTS.md (How deployed)
```

## Template Files

| Template | Purpose | Time to Customize |
|----------|---------|-------------------|
| [SOUL.md.template](SOUL.md.template) | Core values & mission | 10 min |
| [IDENTITY.md.template](IDENTITY.md.template) | Persona & role | 5 min |
| [HEARTBEAT.md.template](HEARTBEAT.md.template) | Current focus | 5 min |
| [MEMORY.md.template](MEMORY.md.template) | Domain knowledge | 15 min |
| [AGENTS.md.template](AGENTS.md.template) | Infrastructure | 10 min |

## After Customization

1. Copy templates to root (remove `.template` suffix)
2. Run `./scripts/setup.sh` to initialize
3. Start your agent

## Example: Complete Agent

See `/examples/` for fully customized agents:
- `software-dev-agent/`
- `research-assistant-agent/`
- `business-ops-agent/`
