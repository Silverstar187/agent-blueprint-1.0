# Subagent Orchestration

> How to delegate complex work to parallel subagents without losing control.

## When to Use Subagents

```
Task comes in
    │
    ├── < 30 seconds? ───────► DIRECT
    │
    ├── Simple command? ─────► DIRECT
    │
    ├── Status/Info? ────────► DIRECT
    │
    ├── Multi-step? ─────────► SUBAGENT
    │
    ├── > 2 min runtime? ────► SUBAGENT
    │
    └── Risk/Isolation? ─────► SUBAGENT
```

**Use subagents when:**
- Task has multiple independent parts
- Runtime exceeds 2 minutes
- Risk of context pollution
- Parallel execution beneficial
- Needs isolation from main context

## Parallel Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    ORCHESTRATOR AGENT                        │
│                                                              │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐          │
│  │  Phase 1    │  │  Phase 2    │  │  Phase 3    │          │
│  │  Parse Args │→ │ Fetch Data  │→ │  Confirm    │          │
│  └─────────────┘  └─────────────┘  └─────────────┘          │
│                                           │                  │
│                                           ▼                  │
│  ┌─────────────────────────────────────────────────────┐    │
│  │  Phase 4: Pre-flight Checks                         │    │
│  │  - Environment check                                │    │
│  │  - Credential validation                            │    │
│  │  - Resource availability                            │    │
│  └─────────────────────────────────────────────────────┘    │
│                           │                                  │
│                           ▼                                  │
│  ┌─────────────────────────────────────────────────────┐    │
│  │  Phase 5: Spawn Sub-agents (Parallel, max 8)        │    │
│  │                                                     │    │
│  │  ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌─────────┐   │    │
│  │  │ Task A  │ │ Task B  │ │ Task C  │ │ Task D  │   │    │
│  │  │ (agent) │ │ (agent) │ │ (agent) │ │ (agent) │   │    │
│  │  └────┬────┘ └────┬────┘ └────┬────┘ └────┬────┘   │    │
│  │       └───────────┴───────────┴───────────┘        │    │
│  │                       │                            │    │
│  │                       ▼                            │    │
│  │              ┌─────────────────┐                   │    │
│  │              │ Results Collect │                   │    │
│  │              └─────────────────┘                   │    │
│  └─────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
```

## Subagent Task Template

```markdown
You are a focused [task-type] agent. Your task is to [specific goal].

<config>
Repository: {REPO}
Branch: {BRANCH}
Base: {BASE_BRANCH}
</config>

<task>
[Detailed task description]
</task>

<instructions>
Follow these steps in order:

1. SETUP - Ensure credentials are available
2. ANALYZE - Understand the context
3. IMPLEMENT - Make minimal, focused changes
4. TEST - Run validation
5. COMMIT - Document changes
6. REPORT - Send back summary
</instructions>

<constraints>
- No force operations
- No unrelated changes
- Time limit: 60 minutes
- [Other constraints]
</constraints>
```

## Spawn Configuration

```json
{
  "agentId": "main",
  "mode": "run",
  "runtime": "subagent",
  "runTimeoutSeconds": 3600,
  "cleanup": "keep",
  "model": "optional-override"
}
```

**Key parameters:**
- `mode: "run"` - One-shot execution
- `mode: "session"` - Persistent conversation
- `cleanup: "keep"` - Preserve transcripts
- `cleanup: "delete"` - Clean up after

## Claim-Based Concurrency Control

Prevent duplicate processing:

```json
// claims.json
{
  "task-identifier-1": "2026-03-13T12:00:00Z",
  "task-identifier-2": "2026-03-13T12:05:00Z"
}
```

**Logic:**
1. Before spawning, check if claim exists and is < 2 hours old
2. If claimed and recent → skip
3. If claimed and expired → remove and proceed
4. After spawning, write claim with current timestamp

## Best Practices

### 1. Clear Briefings
- Explicit task description
- Clear validation criteria
- Defined constraints
- Time limits

### 2. Validation Gates
Require empirical proof:
- `ls -la` for files
- `grep` for content
- `curl` for endpoints
- Test results

### 3. Error Handling
- Set reasonable timeouts
- Handle failures gracefully
- Report partial results
- Document blockers

### 4. Model Selection
- Default: Same as parent
- Complex reasoning: `deepseek/deepseek-reasoner`
- Fast/simple: `google/gemini-3-flash-preview`
- Balanced: `moonshot/kimi-k2.5`

### 5. Result Collection
- Wait for all subagents to complete
- Aggregate results
- Handle failures
- Present summary

## Common Patterns

### Pattern 1: Parallel Issue Fixing
```
1. Fetch 5 GitHub issues
2. Spawn 5 fix-agents (one per issue)
3. Collect PRs created
4. Report summary
```

### Pattern 2: Multi-Domain Analysis
```
1. Spawn code-analysis agent
2. Spawn documentation agent
3. Spawn test-coverage agent
4. Merge findings
```

### Pattern 3: Batch Processing
```
1. Split work into chunks
2. Spawn agents for each chunk
3. Collect results
4. Aggregate final output
```

## Anti-Patterns

❌ **Too many subagents**: >8 parallel agents can overwhelm
✅ **Batch into groups**: Process in batches of 4-8

❌ **Vague tasks**: "Fix the codebase"
✅ **Specific tasks**: "Fix authentication bug in auth.ts"

❌ **No validation**: Accepting results without proof
✅ **Empirical proof**: Require ls/grep/curl/tests

❌ **Ignoring failures**: Continuing when subagent fails
✅ **Graceful handling**: Report failures, continue with partial results

## Example: Complete Workflow

```python
# Pseudo-code for orchestrator

def orchestrate():
    # Phase 1: Parse and validate
    tasks = parse_input()
    
    # Phase 2: Pre-flight checks
    if not validate_environment():
        return error
    
    # Phase 3: Check claims (deduplication)
    unclaimed_tasks = filter_claimed(tasks)
    
    # Phase 4: Spawn subagents
    subagents = []
    for task in unclaimed_tasks[:8]:  # Max 8 parallel
        claim_task(task)
        subagent = spawn_subagent(task)
        subagents.append(subagent)
    
    # Phase 5: Collect results
    results = wait_for_all(subagents)
    
    # Phase 6: Report
    return aggregate_results(results)
```

---

*Subagents multiply your capability. Use them wisely.*
