# Global Claude subagents (canonical)

These are the canonical, version-controlled definitions of Bryan's four personal
**Claude Code subagents**. They are installed (copied) to `~/.claude/agents/`, where Claude
Code loads them for every project:

| File | Subagent | Role |
|------|----------|------|
| `debaun-architect.md` | `debaun-architect` | Solution discovery, ADRs, NFRs, rollout/operability |
| `debaun-coder.md` | `debaun-coder` | .NET / cloud / full-stack implementation |
| `debaun-teacher.md` | `debaun-teacher` | Learning, curriculum, spikes |
| `debaun-tester.md` | `debaun-tester` | Unit / integration / E2E test health |

**Edit these, then re-install** to `~/.claude/agents/` (copy the files across).

The original GitHub Copilot `DeBaun-*.agent.md` personas these were migrated from are in
[`../archive/`](../archive/) (deprecated). Per-repo agents live in each repo's own
`.claude/agents/` directory; see [`../templates/`](../templates/) for the repo-agent templates.
