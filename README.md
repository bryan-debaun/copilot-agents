# Copilot Agents

Personal AI coding agent definitions and templates for AI-assisted development.

## Overview

This repository holds Bryan DeBaun's canonical **Claude Code subagent** definitions, designed to enforce consistent development workflows, GitHub issue-driven development, and quality practices across personal projects. The legacy GitHub Copilot `.agent.md` definitions have been retired to `archive/`.

> **Note:** This is a personal coding agent. It references private repositories and workflows specific to my setup. Feel free to use it as a template for building your own.

## Structure

```text
copilot-agents/
├── agents/                       # Canonical Claude Code subagents
│   ├── debaun-architect.md       # Solution discovery & architecture lead agent
│   ├── debaun-coder.md           # Main personal coding agent
│   ├── debaun-teacher.md         # Teacher and mentorship agent
│   └── debaun-tester.md          # Testing agent (unit / integration / E2E)
├── archive/                      # Deprecated legacy Copilot definitions
│   ├── DeBaun-*.agent.md         # Old Copilot-format agents
│   └── README.md
├── templates/                    # Repo-specific agent templates (legacy Copilot format)
├── docs/
├── scripts/
├── CLAUDE.md
└── README.md
```

## Main Agents

These are [Claude Code subagents](https://docs.claude.com/en/docs/claude-code/sub-agents). Each file's frontmatter sets `name`, `description`, `model`, and the `tools` it may use (core file/exec/web tools plus the GitHub Issues/Projects MCP tools).

**[debaun-coder](agents/debaun-coder.md)** — Comprehensive coding agent configured for:

- GitHub issue-driven development using the current repository's own GitHub Issues, with portfolio-level organization via user-level GitHub Projects (v2) boards
- Feature branch workflows with test baselines
- Commit quality gates (build + tests must pass)
- Draft PR creation for visibility
- MCP tool integration opportunities
- Repo-specific agent creation workflow

**[debaun-architect](agents/debaun-architect.md)** — Solution discovery and lead architecture agent configured for:

- Leading solution discovery and feasibility experiments (spikes & POCs)
- Defining non-functional requirements and measurable success criteria
- Producing Architecture Decision Records (ADRs) and architecture diagrams
- Stakeholder alignment, rollout and rollback planning, and risk mitigation
- Operational readiness: observability, runbooks, and acceptance criteria

**[debaun-teacher](agents/debaun-teacher.md)** — Teacher and mentorship agent configured for:

- Curriculum design, workshops, and short tutorials with hands-on exercises
- Creating exercise sets, starter code, and evaluation rubrics
- Mentorship-style feedback and code reviews to accelerate learning
- Proposing learning paths for emergent technologies and evaluating practical experiments

**[debaun-tester](agents/debaun-tester.md)** — Testing agent configured for:

- Writing new tests and raising coverage across unit, integration, and E2E layers
- Reproducing, diagnosing, and fixing flaky or failing tests
- Test data management and test performance optimization
- Integrating tests reliably into CI pipelines

## Templates

Repository-specific agent templates for different purposes (TL;DR: copy template → replace placeholders → customize → PR).

| Template | Purpose |
|----------|---------|
| **[Coding Agent](templates/repo-coding-agent-template.md)** | Code implementation, development workflows, branching, commits |
| **[Testing Agent](templates/repo-testing-agent-template.md)** | Writing/running tests, coverage analysis, test quality |
| **[Support Agent](templates/repo-support-agent-template.md)** | Answering questions, documentation, onboarding |
| **[PR Reviewer Agent](templates/repo-reviewer-agent-template.md)** | Code reviews, constructive feedback, quality checks |
| **[Issue Template](templates/issue-template.md)** | Discovery/design/spike issue skeleton for well-scoped, actionable work items |

> **Note:** The `templates/*` files are still in the legacy Copilot `.agent.md` format. Converting them to Claude subagent format is tracked separately ([copilot-agents #16](https://github.com/bryan-debaun/copilot-agents/issues/16)).

## Usage

### Installing the Main Agents

Copy the canonical agents to your user-level Claude agents directory so they are available in every project:

```bash
cp agents/debaun-*.md ~/.claude/agents/
```

User-level agents (`~/.claude/agents/`) are available across all projects. Project-scoped agents live in a repository's own `.claude/agents/` and take precedence within that repo. Claude Code picks up agents automatically — invoke them by name or let Claude delegate to them.

### Creating Repo-Specific Agents

1. Choose the appropriate template(s) from the [Templates](#templates) table above
2. Copy the template content
3. Create `.claude/agents/<repo>-<type>.md` in your target repository (Claude subagent format)
   - e.g., `my-project-coder.md`, `my-project-tester.md`
4. Customize the placeholders for your specific project, including the frontmatter `name`, `description`, `model`, and `tools`
5. Add additional agents as needed (a coding agent is recommended as a minimum)

## Related

- Work is tracked per-repo via each repository's own GitHub Issues; portfolio-level organization uses user-level GitHub Projects (v2) boards
- [bryan-debaun/mcp-server](https://github.com/bryan-debaun/mcp-server) - MCP tools server
