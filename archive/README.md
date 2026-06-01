# Archived — GitHub Copilot personas (deprecated)

These `DeBaun-*.agent.md` files are the **original GitHub Copilot** agent personas, retained
for reference only. They have been migrated to Claude Code subagent format.

**Do not edit these.** The canonical Claude versions live in [`../agents/`](../agents/) and are
installed to `~/.claude/agents/`. Per-repo agents live in each repo's `.claude/agents/`.

Key format differences (Copilot → Claude): `name` becomes a kebab-case slug, `description` is
kept, Copilot tool-ids (`read/readFile`, …) map to Claude tool names (or are omitted to inherit
all), the `handoffs:` block is dropped, and an optional `model:` is added.
