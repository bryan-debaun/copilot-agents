# Copilot Agents

Personal VS Code Copilot agent configurations and templates for AI-assisted development.

## Overview

This repository contains custom agent definitions for GitHub Copilot in VS Code, designed to enforce consistent development workflows, GitHub issue-driven development, and quality practices across personal projects.

> **Note:** This is a personal coding agent. It references private repositories and workflows specific to my setup. Feel free to use it as a template for building your own.

## Structure

```
copilot-agents/
├── DeBaun-Coder.agent.md    # Main personal coding agent
├── DeBaun-Architect.agent.md # Solution discovery & architecture lead agent
├── templates/
│   ├── repo-coding-agent-template.md    # Coding agent template
│   ├── repo-testing-agent-template.md   # Testing agent template
│   ├── repo-support-agent-template.md   # Support agent template
│   ├── repo-reviewer-agent-template.md  # PR reviewer agent template
│   └── issue-template.md                 # Discovery/design/spike issue template
└── README.md
```

## Main Agents

**[DeBaun-Coder.agent.md](DeBaun-Coder.agent.md)** - A comprehensive coding agent configured for:

- GitHub issue-driven development with `bryan-debaun/work-tracking` as the master issue tracker
- Feature branch workflows with test baselines
- Commit quality gates (build + tests must pass)
- Draft PR creation for visibility
- MCP tool integration opportunities
- Repo-specific agent creation workflow

**[DeBaun-Architect.agent.md](DeBaun-Architect.agent.md)** - Solution discovery and lead architecture agent configured for:

- Leading solution discovery and feasibility experiments (spikes & POCs)
- Defining non-functional requirements and measurable success criteria
- Producing Architecture Decision Records (ADRs) and architecture diagrams
- Stakeholder alignment, rollout and rollback planning, and risk mitigation
- Operational readiness: observability, runbooks, and acceptance criteria

**[DeBaun-Teacher.agent.md](DeBaun-Teacher.agent.md)** - Teacher and mentorship agent configured for:

- Curriculum design, workshops, and short tutorials with hands-on exercises
- Creating exercise sets, starter code, and evaluation rubrics
- Mentorship-style feedback and code reviews to accelerate learning
- Proposing learning paths for emergent technologies and evaluating practical experiments
- Handoffs to `DeBaun-Architect` and `DeBaun-Coder` for spikes or implementations when appropriate

## Templates

Repository-specific agent templates for different purposes (TL;DR: copy template → replace placeholders → add required fields → run validator → PR).

| Template | Purpose |
|----------|---------|
| **[Coding Agent](templates/repo-coding-agent-template.md)** | Code implementation, development workflows, branching, commits |
| **[Testing Agent](templates/repo-testing-agent-template.md)** | Writing/running tests, coverage analysis, test quality |
| **[Support Agent](templates/repo-support-agent-template.md)** | Answering questions, documentation, onboarding |
| **[PR Reviewer Agent](templates/repo-reviewer-agent-template.md)** | Code reviews, constructive feedback, quality checks |
| **[Issue Template](templates/issue-template.md)** | Discovery/design/spike issue skeleton for well-scoped, actionable work items |

## Usage

### Using the Main Agent

1. Copy `DeBaun-Coder.agent.md` to your VS Code prompts folder:

   ```
   %APPDATA%\Code\User\prompts\
   ```

2. The agent will be available in VS Code Copilot chat

### Creating Repo-Specific Agents

1. Choose the appropriate template(s) from the [Templates](#templates) table above
2. Copy the template content
3. Create `.github/agents/[repo-name]-[type].agent.md` in your target repository
   - e.g., `my-project-coder.agent.md`, `my-project-tester.agent.md`
4. Customize the placeholders for your specific project
5. Add additional agents as needed (coding agent is recommended as a minimum)

## Related

- [bryan-debaun/work-tracking](https://github.com/bryan-debaun/work-tracking) - Master issue tracking
- [bryan-debaun/mcp-server](https://github.com/bryan-debaun/mcp-server) - MCP tools server
