# Copilot Agents

Personal VS Code Copilot agent configurations and templates for AI-assisted development.

## Overview

This repository contains custom agent definitions for GitHub Copilot in VS Code, designed to enforce consistent development workflows, GitHub issue-driven development, and quality practices across personal projects.

> **Note:** This is a personal coding agent. It references private repositories and workflows specific to my setup. Feel free to use it as a template for building your own.

## Structure

```
copilot-agents/
├── DeBaun-Coder.agent.md    # Main personal coding agent
├── templates/
│   └── repo-agent-template.md   # Template for creating repo-specific agents
└── README.md
```

## Main Agent

**[DeBaun-Coder.agent.md](DeBaun-Coder.agent.md)** - A comprehensive coding agent configured for:

- GitHub issue-driven development with `bryan-debaun/work-tracking` as the master issue tracker
- Feature branch workflows with test baselines
- Commit quality gates (build + tests must pass)
- Draft PR creation for visibility
- MCP tool integration opportunities
- Repo-specific agent creation workflow

## Templates

**[templates/repo-agent-template.md](templates/repo-agent-template.md)** - Template for creating repository-specific coding agents that inherit:

- GitHub issue-driven development practices
- Development workflow (branching, testing, commits)
- MCP tool opportunity identification

## Usage

### Using the Main Agent

1. Copy `DeBaun-Coder.agent.md` to your VS Code prompts folder:

   ```
   %APPDATA%\Code\User\prompts\
   ```

2. The agent will be available in VS Code Copilot chat

### Creating Repo-Specific Agents

1. Open the [repo-agent-template.md](templates/repo-agent-template.md)
2. Copy the template content
3. Create `.github/agents/[repo-name]-coder.agent.md` in your target repository
4. Customize the placeholders for your specific project

## Related

- [bryan-debaun/work-tracking](https://github.com/bryan-debaun/work-tracking) - Master issue tracking
- [bryan-debaun/mcp-server](https://github.com/bryan-debaun/mcp-server) - MCP tools server
