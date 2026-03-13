---
name: ontology
description: Typed knowledge graph for structured agent memory and composable skills. Use when creating/querying entities (Person, Project, Task, Event, Document), linking related objects, enforcing constraints, planning multi-step actions as graph transformations, or when skills need to share state. Trigger on "remember", "what do I know about", "link X to Y", "show dependencies", entity CRUD, or cross-skill data access.
---

# Ontology

A typed vocabulary + constraint system for representing knowledge as a verifiable graph.

## Core Concept
Everything is an **entity** with a **type**, **properties**, and **relations** to other entities.

## When to Use
| Trigger | Action |
|---------|--------|
| "Remember that..." | Create/update entity |
| "What do I know about X?" | Query graph |
| "Link X to Y" | Create relation |

## Storage
Default: `memory/ontology/graph.jsonl`

## Quick Start
```bash
# Create Entity
python3 scripts/ontology.py create --type Person --props '{"name":"Alice"}'

# Query
python3 scripts/ontology.py list --type Person
```
