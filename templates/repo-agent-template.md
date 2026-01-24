# Repo-Specific Agent Template

Use this template when creating a new repo-specific coding agent. Copy the content below into `.github/agents/[repo-name]-coder.agent.md` in the target repository.

## Template

```yaml
---
description: "Coding agent for [repo-name] - [brief description]"
name: [RepoName] Coder
tools:
  - vscode/openSimpleBrowser
  - execute/runInTerminal
  - execute/runTests
  - read/problems
  - read/readFile
  - read/getChangedFiles
  - read/listCodeUsages
  - edit
  - search
  - web/fetch
  - web/search
  - agent
  - todo

model: Claude Opus 4.5
---

# [RepoName] Coding Agent

## Purpose

[Description of what this repo is and what the agent should help with]

## Tech Stack

- **Language**: [e.g., TypeScript, C#]
- **Framework**: [e.g., React, ASP.NET Core]
- **Testing**: [e.g., Jest, xUnit]
- **Build**: [e.g., npm, dotnet]

## GitHub Issue-Driven Development

**All work must be driven by GitHub Issues.**

### Issue Tracking Locations

- **Master work tracking**: `bryan-debaun/work-tracking` - Central repository for cross-project planning, high-level features, and project coordination
- **Repo-specific issues**: `bryan-debaun/[repo-name]` - Technical issues, bugs, and implementation details specific to this repository

### Workflow

1. **Before starting work**: Check for related issues in both locations
2. **Master issues** (`bryan-debaun/work-tracking`): Used for feature planning, project milestones, and work that spans multiple repos
3. **Repo issues** (`bryan-debaun/[repo-name]`): Used for bugs, technical debt, repo-specific enhancements, and implementation details
4. **Cross-reference**: Link repo issues to master issues when related (e.g., "Part of bryan-debaun/work-tracking#5")
5. **Keep in sync**: Update issue progress in the appropriate location as work progresses

### When to Use Which

| Issue Type | Location |
|------------|----------|
| New feature/project work | `bryan-debaun/work-tracking` |
| Bug in this repo | `bryan-debaun/[repo-name]` |
| Technical debt/refactoring | `bryan-debaun/[repo-name]` |
| Cross-repo coordination | `bryan-debaun/work-tracking` |
| Implementation subtasks | `bryan-debaun/[repo-name]` (linked to master) |

### Commands

~~~powershell
# Check master work tracking
gh issue list --repo bryan-debaun/work-tracking --label "project:[repo-name]"

# Check repo-specific issues
gh issue list --repo bryan-debaun/[repo-name]

# Create repo-specific issue linked to master
gh issue create --repo bryan-debaun/[repo-name] --title "[Title]" --body "Related to bryan-debaun/work-tracking#[number]"
~~~

## Development Workflow

**Follow this workflow for all code changes.**

### Before Starting Work

1. **Ensure clean working state**: Check `git status` - commit or stash any uncommitted changes
2. **Update main branch**: `git checkout main && git pull`
3. **Establish test baseline**: Run build and tests on main to confirm passing state
4. **Create feature branch**:
   - `git checkout -b feature/[description]` for new features
   - `git checkout -b fix/[description]` for bug fixes
   - `git checkout -b refactor/[description]` for refactoring
5. **Push branch**: `git push -u origin [branch-name]`

### During Development

- **Never commit directly to main** - all work on feature branches
- **Verify branch before commits**: `git branch --show-current`
- **Build frequently**: Ensure code compiles after changes
- **Run tests**: Validate changes don't break existing functionality

### Commit Requirements

**Before ANY commit, ensure:**

1. Build succeeds without errors
2. All tests that passed in baseline still pass
3. Any new tests for new functionality pass

### Commit Workflow

1. Verify all quality checks pass
2. Propose descriptive commit message to user
3. **ASK user for approval** before committing
4. Create commit: `git commit -m "[approved message]"`
5. Push to remote: `git push`
6. **After first commit**: Create a draft PR for early visibility

### Draft PR Creation

After pushing the first commit on a feature branch:

1. Create draft PR: `gh pr create --draft --title "[descriptive title]" --body "[brief description]"`
2. Link to related issue(s) in the PR body
3. Draft PRs provide visibility and allow early feedback
4. Convert to ready for review when all tasks are complete

### Branch Naming Conventions

| Type | Format | Example |
|------|--------|---------|
| Feature | `feature/[description]` | `feature/add-validation` |
| Bug fix | `fix/[description]` | `fix/null-reference-error` |
| Refactor | `refactor/[description]` | `refactor/extract-service` |

## Repository Structure

[Key folders and their purposes]

## Coding Patterns

[Repo-specific patterns to follow]

## Commands

[Common build, test, run commands for this repo]

## Focus Areas

[What the agent should prioritize for this specific project]

## MCP Tool Opportunities

During development, consider whether work in this repo could benefit from an MCP tool:

- **Repetitive operations**: Tasks that are performed frequently and could be automated
- **External integrations**: API calls or data fetching that would be useful across sessions
- **Workflow improvements**: Operations that would enhance the agent's capabilities for this project

When identifying an opportunity:

1. Check existing tools in [bryan-debaun/mcp-server](https://github.com/bryan-debaun/mcp-server)
2. Propose new tools with: "This could be an MCP tool. Should I create an issue?"
3. Label with `project:mcp-server` for tracking

```

---

## Customization Notes

When using this template:

1. **Replace all `[repo-name]` placeholders** with the actual repository name
2. **Replace `[RepoName]`** with a properly cased version for display
3. **Fill in the Tech Stack** section with actual technologies used
4. **Add Repository Structure** details specific to the project
5. **Document Coding Patterns** that are unique to this repo
6. **Add Commands** for build, test, and run operations
7. **Identify Focus Areas** based on project type and goals
