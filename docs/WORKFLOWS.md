# The 7-Phase Protocol

> A senior developer workflow for consistent, high-quality execution.

## Overview

Every task, from simple fixes to complex architectures, follows these 7 phases:

```
0. TOOL INVENTORY    → Check TOOLS.md and skills first
1. ANALYSIS          → Why before How?
2. RESEARCH          → Search and read, identify dependencies
3. STRATEGY          → Architecture and edge cases
4. ESTIMATION        → Token/Time/Cost check
5. IMPLEMENTATION    → Atomic increments, set -e
6. VALIDATION        → Empirical proof (ls, grep, curl, tests)
7. PERSISTENCE       → Document in MEMORY.md and indices
```

**Golden Rule:** Phase 0 prevents reinventing the wheel.

---

## Phase 0: Tool Inventory

**Before doing anything, check:**

1. **TOOLS.md** - What capabilities exist?
2. **Installed skills** - Is there a skill for this?
3. **Past solutions** - `brv query "[similar task]"`

**Why this matters:**
- Avoid rewriting existing solutions
- Use tested patterns
- Save time and tokens

**Example:**
```
User: "Rotate this PDF"
→ Check TOOLS.md: "pdf-editor skill available"
→ Use skill instead of writing new code
```

---

## Phase 1: Analysis

**Question: Why before How?**

Understand before acting:
- What is the real problem?
- What are the constraints?
- What does success look like?
- Who are the stakeholders?

**Deliverable:** Clear problem statement

**Example:**
```
❌ "Fix the bug"
✅ "Users can't login because auth token expires after 1h instead of 24h"
```

---

## Phase 2: Research

**Search, read, identify dependencies.**

Activities:
- `web_search` for current info
- `read` relevant files
- `brv query` for internal patterns
- Check similar implementations

**Deliverable:** Knowledge summary + dependencies list

**Checklist:**
- [ ] External research (web, docs)
- [ ] Internal research (memory, patterns)
- [ ] Dependencies identified
- [ ] Similar solutions found

---

## Phase 3: Strategy

**Architecture and edge cases.**

Define:
- Approach (direct vs. indirect)
- Architecture (components, data flow)
- Edge cases (failure modes, limits)
- Trade-offs (speed vs. quality, etc.)

**Deliverable:** Implementation plan

**Template:**
```markdown
## Strategy

### Approach
[Direct/Incremental/Parallel/etc.]

### Architecture
[Components and flow]

### Edge Cases
- [Case 1]
- [Case 2]

### Trade-offs
| Option | Pros | Cons |
|:---|:---|:---|
| A | ... | ... |
| B | ... | ... |
```

---

## Phase 4: Estimation

**Token/Time/Cost check.**

Estimate:
- **Time:** How long will this take?
- **Tokens:** Approximate token usage
- **Cost:** API/service costs
- **Risk:** What could go wrong?

**Deliverable:** Estimates + risk assessment

**When estimates are high:**
- Break into smaller tasks
- Use subagents for parallelism
- Consider simpler approach

---

## Phase 5: Implementation

**Atomic increments with `set -e`.**

Principles:
- One change at a time
- Test after each increment
- Fail fast (`set -e` in bash)
- Small, reviewable commits

**Deliverable:** Working implementation

**Pattern:**
```bash
# 1. Make change
edit file.md "old" "new"

# 2. Validate
grep "new" file.md

# 3. Next increment
```

---

## Phase 6: Validation

**Empirical proof.**

Never assume—verify:

| Check | Command | Purpose |
|:---|:---|:---|
| File exists | `ls -la path/` | Confirm creation |
| Content correct | `grep "pattern" file` | Verify changes |
| Service running | `curl http://localhost:port` | Check endpoint |
| Tests pass | `npm test` / `pytest` | Validate logic |
| Process active | `ps aux \| grep process` | Confirm execution |

**Deliverable:** Proof of correctness

**Rule:** No bullshit—only empirical validation.

---

## Phase 7: Persistence

**Document in MEMORY.md and indices.**

Update:
- `MEMORY.md` - What you learned
- Project indices - Status and links
- `HEARTBEAT.md` - If priorities changed
- Daily log - What you did

**Deliverable:** Updated documentation

**Why this matters:**
- Future you will thank present you
- Patterns compound
- Knowledge survives sessions

---

## Quick Reference Card

```
┌─────────────────────────────────────────────────────────────┐
│  0. TOOL INVENTORY                                          │
│     Check TOOLS.md, skills, brv query                       │
├─────────────────────────────────────────────────────────────┤
│  1. ANALYSIS                                                │
│     Why before How?                                         │
├─────────────────────────────────────────────────────────────┤
│  2. RESEARCH                                                │
│     Search, read, identify dependencies                     │
├─────────────────────────────────────────────────────────────┤
│  3. STRATEGY                                                │
│     Architecture and edge cases                             │
├─────────────────────────────────────────────────────────────┤
│  4. ESTIMATION                                              │
│     Token/Time/Cost check                                   │
├─────────────────────────────────────────────────────────────┤
│  5. IMPLEMENTATION                                          │
│     Atomic increments, set -e                               │
├─────────────────────────────────────────────────────────────┤
│  6. VALIDATION                                              │
│     Empirical proof (ls, grep, curl, tests)                 │
├─────────────────────────────────────────────────────────────┤
│  7. PERSISTENCE                                             │
│     Document in MEMORY.md                                   │
└─────────────────────────────────────────────────────────────┘
```

---

## Example: Complete Workflow

**Task:** "Add user authentication to the API"

**Phase 0:** Check TOOLS.md → auth skill available

**Phase 1:** Analysis
- Need JWT-based auth
- Must support refresh tokens
- Admin vs. user roles

**Phase 2:** Research
- `web_search "JWT best practices 2024"`
- `brv query "authentication pattern"`
- Read existing auth code

**Phase 3:** Strategy
- Use existing auth middleware
- Add refresh token endpoint
- Update user model

**Phase 4:** Estimation
- Time: 2 hours
- Tokens: ~10k
- Risk: Low (existing patterns)

**Phase 5:** Implementation
- Add refresh endpoint
- Update middleware
- Add role checks

**Phase 6:** Validation
- `curl -X POST /auth/refresh`
- `grep "refresh" middleware.ts`
- `npm test auth`

**Phase 7:** Persistence
- Update MEMORY.md with auth pattern
- Log to daily diary
- Update project index

---

## Common Mistakes

❌ **Skip Phase 0** → Reinvent the wheel
❌ **Skip Phase 1** → Solve wrong problem
❌ **Skip Phase 6** → Ship broken code
❌ **Skip Phase 7** → Lose knowledge

✅ **Follow all 7** → Consistent, high-quality results

---

*The 7-Phase Protocol is your foundation. Master it.*
