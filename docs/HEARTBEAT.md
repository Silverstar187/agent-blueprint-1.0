# Heartbeat System

> Self-directed progress tracking that keeps the agent moving even when human input is sparse.

## What is the Heartbeat?

The **Heartbeat** is a living document that answers three questions:
1. **What is the current status?**
2. **What are the active blockers?**
3. **What should happen next?**

It's designed for **autonomous operation** — when the human is quiet, the heartbeat tells the agent what to work on.

## The 5-Todo Rule

Every active work item has a **maximum of 5 open todos**.

**Why 5?**
- Forces task decomposition
- Prevents overwhelm
- Enables clear progress tracking
- Triggers derivation of new cards when exceeded

**What if you have more than 5?**
- Derive a new work item/card
- Or mark existing todos as complete before adding new ones

## Heartbeat Structure

```markdown
## 🎯 FINAL GOAL
**[Measurable objective]?** ❌/✅ | **DEADLINE:** YYYY-MM-DD

## 📊 ACTIVE PROJECTS
| Project | Status | Next Action | Priority |
|:---|:---|:---|:---|
| [Name] | 🔴🟡🟢 | [Step] | P0/P1/P2 |

## 🔥 TODAY'S FOCUS
**Today:** [Single priority]
**Why:** [Justification]

## 🚧 Active Blockers
| Blocker | Since | Resolution |
|:---|:---|:---|
| [Issue] | [Time] | [Next step] |

## ✅ RECENT WINS
- [x] [Completed item]

## 🎮 AUTONOMOUS ACTION
**When blocked >[X]h:**
1. [Fallback action 1]
2. [Fallback action 2]
3. [Fallback action 3]

## 🔄 SYNC RULES
- [How Heartbeat ↔ external tool sync works]

## 🎯 HEARTBEAT_OK Conditions
- [ ] [Criteria 1]
- [ ] [Criteria 2]
```

## Autonomous Action Protocol

**When human input is absent and blockers exceed threshold (e.g., 2 hours):**

1. **Check alternate work streams**
   - Are there other non-blocked priorities?
   
2. **Review backlog for ready items**
   - What's waiting that could be started?
   
3. **Work on non-blocked priorities**
   - Make progress where possible
   
4. **Document and escalate persistent blockers**
   - If still blocked, notify human clearly

## Priority System

| Priority | Meaning | Response Time |
|:---|:---|:---|
| 🔴 **P0** | Today (critical) | Immediate |
| 🟠 **P1** | This week | 24-48 hours |
| 🟡 **P2** | This month | This week |
| 🟢 **P3** | Someday | As time permits |

## Integration with External Tools

**Common pattern:** HEARTBEAT.md ↔ Trello/Notion/Linear

```
External Tool (Source of Truth)
         │
         ▼ (Auto)
   HEARTBEAT.md (Status + Next Actions)
         │
         ▼ (Manual)
   Results posted back to External Tool
```

## HEARTBEAT_OK Protocol

**When the system sends a heartbeat check:**

Reply **exactly**: `HEARTBEAT_OK`

**Only if:**
- [ ] External board updated
- [ ] At least 1 item progressed
- [ ] OR new item created
- [ ] OR blocker documented with communication

**Otherwise:**
- Identify blocker
- Document in HEARTBEAT.md
- Notify human

## Example: Daily Workflow

**Morning:**
1. Read HEARTBEAT.md
2. Check external tool for updates
3. Identify today's focus

**Throughout day:**
1. Work on focus item
2. Update progress in real-time
3. Document blockers immediately

**Evening:**
1. Update HEARTBEAT.md with wins
2. Move completed items to "Wins"
3. Define tomorrow's focus
4. Sync to GitHub

## Metrics Tracking

Track progress over time:

```markdown
## 📈 METRICS (Weekly)

| Week | [Metric 1] | [Metric 2] | [Metric 3] |
|:---|:---|:---|:---|
| KW## | [Value] | [Value] | [Value] |
```

## Common Patterns

### Software Dev Agent
- Focus: Current sprint tasks
- Blockers: PR reviews, dependencies
- Fallback: Documentation, tech debt

### Research Agent
- Focus: Current hypothesis
- Blockers: Data access, source materials
- Fallback: Literature review, methodology

### Business Agent
- Focus: Revenue-generating activities
- Blockers: Client responses, approvals
- Fallback: Lead generation, content creation

## Anti-Patterns to Avoid

❌ **Vague goals**: "Make progress on project"
✅ **Specific goals**: "Deploy feature X to staging"

❌ **Ignored blockers**: Letting issues sit for days
✅ **Active escalation**: Document and notify after threshold

❌ **Stagnant heartbeat**: Not updating for weeks
✅ **Living document**: Updated daily, reflects reality

---

*The heartbeat is your engine. Keep it beating.*
