# Available Tools

> Reference guide for all tools available to the agent.

## Core Infrastructure

### File Operations

| Tool | Purpose | Example |
|:---|:---|:---|
| `read` | Read file contents | `read path/to/file.md` |
| `write` | Create/overwrite files | `write path/file.md content` |
| `edit` | Surgical text replacement | `edit path/file.md old_text new_text` |

**Best practices:**
- Use `read` with `offset`/`limit` for large files
- Use `write` for new files, `edit` for changes
- Always validate paths before operations

### Shell Execution

| Tool | Purpose | Example |
|:---|:---|:---|
| `exec` | Run commands | `exec "ls -la"` |
| `process` | Manage background processes | `process action=list` |

**Safety:**
- Use `yieldMs` for long-running commands
- Check exit codes
- Use `pty=true` for TTY-required commands

### Browser Control

| Tool | Purpose | Example |
|:---|:---|:---|
| `browser` | Web automation | `browser action=snapshot url=...` |

**Modes:**
- `snapshot` - Capture page structure
- `act` - Click, type, navigate
- `screenshot` - Capture visual

## Communication

| Tool | Purpose | Example |
|:---|:---|:---|
| `message` | Send to channels | `message action=send to=...` |
| `tts` | Text-to-speech | `tts text="Hello"` |
| `voice_call` | Phone calls | `voice_call action=initiate_call` |

**Note:** Only use `message` when explicitly instructed to contact external recipients.

## Knowledge & Memory

| Tool | Purpose | Example |
|:---|:---|:---|
| `web_search` | Real-time search | `web_search query="..."` |
| `web_fetch` | Extract from URL | `web_fetch url="..."` |
| `memory_search` | Search local memory | `memory_search query="..."` |
| `brv query` | Semantic RAG search | `brv query "pattern"` |
| `ontology` | Knowledge graph | `ontology action=create` |

**Hierarchy:**
1. `web_search` - Current, external info
2. `brv query` - Semantic, internal patterns
3. `memory_search` - File-based local memory

## Development

| Tool | Purpose | Example |
|:---|:---|:---|
| `pdf` | Analyze PDFs | `pdf pdf=path prompt="..."` |
| `sessions_spawn` | Create subagents | `sessions_spawn task="..."` |
| `subagents` | Manage subagents | `subagents action=list` |

## Workflow

| Tool | Purpose | Example |
|:---|:---|:---|
| `agents_list` | List available agents | `agents_list` |
| `sessions_list` | List sessions | `sessions_list` |
| `sessions_send` | Send to session | `sessions_send sessionKey="..."` |

## Tool Selection Guide

**When user asks for...**

| Request | Primary Tool | Fallback |
|:---|:---|:---|
| "Find info about X" | `web_search` | `brv query` |
| "Read this URL" | `web_fetch` | `browser` |
| "Work on multiple things" | `sessions_spawn` | Sequential |
| "What did I say about Y?" | `memory_search` | `brv query` |
| "Analyze this PDF" | `pdf` | - |
| "Send message to Z" | `message` | - |

## Rate Limits & Best Practices

### Web Search
- ~10 results per query
- Use `freshness` for recent info
- Use `date_after`/`date_before` for ranges

### Subagents
- Max 8 parallel recommended
- Set `runTimeoutSeconds` (default: 300)
- Use `cleanup: keep` for debugging

### File Operations
- Read truncated at 2000 lines/50KB
- Use `offset`/`limit` for large files
- Prefer `edit` over `write` for changes

## Tool Approval Levels

| Risk | Action |
|:---|:---|
| Low (read-only) | Auto-execute |
| Medium (file writes) | Auto-execute in workspace |
| High (external calls) | User approval required |
| Critical (privileged) | Explicit confirmation |

---

*When in doubt, check TOOLS.md in your workspace for specific configurations.*
