---
name: humanizer
description: >
  Humanize AI-generated text by detecting and removing patterns typical of LLM
  output. Rewrites text to sound natural, specific, and human.
---

# Humanizer: remove AI writing patterns

## Core principles
### Write like a human
- Use "is" and "has" freely
- One qualifier per claim
- End with something specific

### Add personality
- Have opinions
- Vary sentence rhythm
- Let some mess in

## Using the analyzer
```bash
# Score text
echo "Your text here" | node src/cli.js score

# Full analysis report
node src/cli.js analyze -f draft.md

# Humanize with auto-fixes
node src/cli.js humanize --autofix -f article.txt
```
