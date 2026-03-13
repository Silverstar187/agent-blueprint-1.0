---
name: byterover
description: "You MUST use this for gathering contexts before any work. This is a Knowledge management for AI agents. Use `brv` to store and retrieve project patterns, decisions, and architectural rules in .brv/context-tree. Uses a configured LLM provider (default: ByteRover, no API key needed) for query and curate operations."
---

# ByteRover Knowledge Management

Use the `brv` CLI to manage your project's long-term memory.
Install: `npm install -g byterover-cli`
Knowledge is stored in `.brv/context-tree/` as Markdown files.

## Workflow
1. **Before Thinking:** Run `brv query` to understand existing patterns.
2. **After Implementing:** Run `brv curate` to save new patterns/decisions.

## Commands
```bash
brv query "How is authentication implemented?"
brv curate "Auth uses JWT with 24h expiry" -f src/middleware/auth.ts
brv providers connect byterover
```
