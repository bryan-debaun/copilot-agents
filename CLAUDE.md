# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

The **canonical source for Bryan's personal AI agent definitions** — authored and version-controlled here, then *installed* to two targets (see below). It is a docs/Markdown repo, not a build target: there is no package manager, app, or server.

Two kinds of agent live here:

- **Global personas** (`debaun-architect`, `-coder`, `-teacher`, `-tester`) — verbose, full-system-prompt definitions of Bryan's reusable working style (issue-driven dev, feature-branch discipline, technical-decision framework, code-quality bar). Repo-agnostic.
- **Per-repo agents** (`<repo>-coder`, `-tester`, `-reviewer`, `-support`) — concise, repo-specific instructions (build/test commands, file layout, patterns) derived from a template. They lean on the repo's own `CLAUDE.md` rather than restating the persona prompt.

## Migration in progress: Copilot `.agent.md` → Claude subagent `.md`

Bryan is migrating **fully to Claude**. The legacy GitHub Copilot persona files at the repo root —
`DeBaun-Architect.agent.md`, `DeBaun-Coder.agent.md`, `DeBaun-Teacher.agent.md`, `DeBaun-Tester.agent.md` —
are being **archived/deprecated** in favor of the Claude subagent format. They remain as the historical reference (and the `DeBaun-Coder` file still carries the most complete workflow narrative), but **new authoring targets the Claude `.md` format.** Treat the `.agent.md` files as source-of-truth for *content/intent*, not for *format*.

The four personas are already installed as Claude subagents:

| Source (this repo, Copilot)   | Installed Claude persona              | Per-repo Claude agents (examples)                          |
|-------------------------------|---------------------------------------|------------------------------------------------------------|
| `DeBaun-Architect.agent.md`   | `~/.claude/agents/debaun-architect.md`| —                                                          |
| `DeBaun-Coder.agent.md`       | `~/.claude/agents/debaun-coder.md`    | `<repo>/.claude/agents/<repo>-coder.md`                    |
| `DeBaun-Teacher.agent.md`     | `~/.claude/agents/debaun-teacher.md`  | —                                                          |
| `DeBaun-Tester.agent.md`      | `~/.claude/agents/debaun-tester.md`   | `<repo>/.claude/agents/<repo>-tester.md`                   |

Per-repo agents are installed in each target repo's `.claude/agents/` — e.g. `bryandebaun.dev` and `mcp-server` already carry `-coder`, `-reviewer`, `-support`, `-tester`.

## Frontmatter: Copilot format → Claude subagent format

When porting an `.agent.md` to a Claude `.md` subagent, the YAML frontmatter changes:

| Copilot `.agent.md`                                  | Claude subagent `.md`                                  |
|------------------------------------------------------|--------------------------------------------------------|
| `name: DeBaun Coder` (display name)                  | `name: debaun-coder` (kebab-case slug)                 |
| `description:`                                       | `description:` (kept; for per-repo agents, write it to drive *when* Claude delegates) |
| `tools:` as Copilot tool-ids (`execute/runInTerminal`, `read/readFile`, `edit`, `search`, `web`, `agent`, `todo`) | `tools:` as **Claude tool names** (`Bash`, `Read`, `Edit`, `Glob`, `Grep`, `WebFetch`, `TodoWrite`, `mcp__bryan-debaun-mcp__*`, …) |
| `handoffs:` (label/agent/prompt)                     | **dropped** — Claude delegates via subagent invocation + the `description`, not explicit handoff blocks |
| —                                                    | `model:` (e.g. `sonnet`) — Claude-only field          |

Practical differences observed in the installed files:

- **Global personas** keep frontmatter minimal — just `name` + `description` — and inherit tools/model from the session, since the verbose body *is* the value.
- **Per-repo agents** are explicit: `name` + `description` + `model` + an itemized `tools` list (including the specific `mcp__bryan-debaun-mcp__*` tools that agent is allowed to call). The body is short and repo-specific, deferring workflow detail to the persona and the repo's `CLAUDE.md`.

## Layout

```
DeBaun-*.agent.md        # the four legacy Copilot personas (being archived)
templates/               # repo-agent templates: coding / testing / reviewer / support + issue-template
docs/                    # authoring references (see below)
agent-artifacts/         # ADR/issue/PR draft templates + validate-markdown.ps1 / validate-terminal.ps1
scripts/                 # validate-agent-templates.sh
.github/workflows/       # validate-templates.yml (CI)
```

### Authoring resources
- **`templates/`** — start here when creating a per-repo agent: copy `repo-<role>-agent-template.md`, replace `[repo-name]` / `[RepoName]`, fill repo-specific frontmatter, validate, PR. (Templates are still written in the Copilot frontmatter style with `handoffs:`; apply the format mapping above when targeting a Claude subagent.)
- **`docs/`** — `agent-templates.md` (apply/validate flow), `repo-agent-creation.md` (full new-repo workflow), `subagents.md`, `github-interactions.md` (compose issue/PR bodies in Markdown, `gh --body-file`), `mcp-tools.md` (prefer `bryan-debaun-mcp` tools; proposing new ones), `terminal-guidance.md` (PowerShell, no POSIX `&&`).

### Validation & CI
- `scripts/validate-agent-templates.sh` (bash) checks that templates contain the required frontmatter keys (`description`/`name`/`tools`/`handoffs`) and that any tracked `*.agent.md` has had its `[repo-name]`/`[RepoName]` placeholders replaced (the example `DeBaun-Coder.agent.md` is skipped). It uses `git ls-files`, so files must be tracked to be checked.
- `agent-artifacts/validate-markdown.ps1` / `validate-terminal.ps1` lint draft bodies and PowerShell command files before posting/running.
- `.github/workflows/validate-templates.yml` runs the bash validator on PRs — but **only when `templates/**` (or the workflow itself) changes.** Edits to the root `.agent.md` personas or to `scripts/` are **not** covered by CI; validate those locally.

## Conventions specific to this repo
- The validator's required `tools:`/`handoffs:` keys reflect the **Copilot** format; the validator has not yet been updated for the Claude frontmatter (`model:`, no `handoffs:`). Account for this when adding Claude-format files to `templates/`.
- `agent-artifacts/` is the scratch space for agent-generated drafts (per the README there it is intended to be gitignored/local-only); don't scatter temp files elsewhere.
- `README.md` is Copilot-era and predates the Claude migration — it documents only three personas (omits Tester) and the VS Code install path. **Trust this file and the installed `~/.claude/agents/` set over the README** for current state.
