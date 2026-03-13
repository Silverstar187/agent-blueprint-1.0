---
name: skill-creator
description: Create, edit, improve, or audit AgentSkills. Use when creating a new skill from scratch or when asked to improve, review, audit, tidy up, or clean up an existing skill or SKILL.md file. Also use when editing or restructuring a skill directory (moving files to references/ or scripts/, removing stale content, validating against the AgentSkills spec). Triggers on phrases like "create a skill", "author a skill", "tidy up a skill", "improve this skill", "review the skill", "clean up the skill", "audit the skill".
---

# Skill Creator

This skill provides guidance for creating effective skills.

## About Skills

Skills are modular, self-contained packages that extend an agent's capabilities by providing specialized knowledge, workflows, and tools.

## Core Principles

### Concise is Key
The context window is a public good. Only add context the model doesn't already have. Prefer concise examples over verbose explanations.

### Anatomy of a Skill
```
skill-name/
├── SKILL.md (required)
│   ├── YAML frontmatter metadata (required)
│   │   ├── name: (required)
│   │   └── description: (required)
│   └── Markdown instructions (required)
└── Bundled Resources (optional)
    ├── scripts/          - Executable code
    ├── references/       - Documentation
    └── assets/           - Output templates/files
```

## Skill Creation Process
1. Understand the skill with concrete examples
2. Plan reusable contents (scripts, references, assets)
3. Initialize (run init_skill.py)
4. Edit SKILL.md and implement resources
5. Package (run package_skill.py)
6. Iterate based on usage
