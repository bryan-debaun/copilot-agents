# Repo-Specific Coding Agent Template (Condensed)

Use this template to create a coding-focused agent for a repository. It is GitHub-issue driven and derives its workflow, quality gates, and handoff conventions from the DeBaun-Coder instructions. Fill repository-specific placeholders when applying this template.

```markdown
---
description: "Coding agent for [RepoName] - [brief description]"
name: "[RepoName] Coder"
tools:

- vscode/openSimpleBrowser
- execute/runInTerminal
- execute/runTests
- read/readFile
- read/getChangedFiles
- read/listCodeUsages
- edit
- search
- web/fetch
- agent
- todo

handoffs:

- label: "[RepoName] Tester"
    agent: "[RepoName] Tester"
    prompt: "Write and run tests for new or changed code. Include: Context, Related Issue, Files Changed, Areas Needing Tests, and Suggested Test Approach."
- label: "[RepoName] Reviewer"
    agent: "[RepoName] Reviewer"
    prompt: "Review PRs for correctness, patterns, and risks. Include: PR link, Review Focus, and Blocking Issues."
- label: "[RepoName] Support"
    agent: "[RepoName] Support"
    prompt: "Request clarifications; include Context and Proposed Acceptance Criteria."
---

# [RepoName] Coder

## Purpose

Short, practical guidance for implementing changes in this repository. Use this as the authoritative agent-run checklist when starting work.

## Quick start (issue-driven)

- Check master tracker and repo issues: `gh issue list --repo bryan-debaun/work-tracking --label "project:[repo-name]"` and `gh issue list --repo bryan-debaun/[repo-name]`.
- Ensure a clear, testable issue exists. If not, draft one and ask the user before creating.
- Establish baseline: `git checkout main && git pull`; run build and tests; note failing tests and coverage.

### Issue quality checklist

- Clear problem statement and scope
- Acceptance criteria (testable)
- Labels: `project:[repo-name]`, `type:`, `priority:`
- Task checklist for multi-step work

## Before starting work

1. Ensure clean working state and up-to-date main
2. Establish test baseline and record results
3. Create a feature branch (e.g., `feature/[short-desc]`) and push upstream

## Development workflow (condensed)

- Work on a feature branch; never commit directly to `main`.
- Build and run tests frequently. Fix issues before committing.
- Commit requirements (before commit): build succeeds, baseline tests still pass, new tests pass, and new tests are meaningful.
- Ask the user for approval on commit message before committing: `git commit -m "[approved message]"`.
- Create a draft PR after the first push: `gh pr create --draft --title "[title]" --body "[short description]"`.

## Handoff templates (standardized)

- Coder → Tester: Context, Related Issue, Files Changed, Areas Needing Tests, Existing Test Patterns
- Coder → Reviewer: PR link, Related Issue, Summary of Changes, Areas for Review Focus
- Support → Coder: Context Summary, Proposed Acceptance Criteria, Related Issue (or suggest one)

## Commit & test expectations

- Baseline tests must pass locally before commit
- Prefer adding unit tests & integration tests for behavior changes
- Aim to avoid flaky tests; keep unit tests fast and isolated
- Include test commands in repo-specific fields (see Customization)

## Branch & naming conventions

- Feature: `feature/[short-desc]`
- Fix: `fix/[short-desc]`
- Refactor: `refactor/[short-desc]`

```

## Customization notes

- Replace placeholders (`[repo-name]`, `[RepoName]`, build/test commands, coverage targets) before using as the repo's canonical agent instructions.
- The agent creating repo-specific instructions should add repository fields it needs (e.g., `buildCommand`, `testCommand`, `coverageTarget`) to the top-level frontmatter.
- Keep the guidance minimal and actionable; prefer explicit commands and example values.

---

*Generated from DeBaun-Coder guidance (condensed template). Replace placeholders and adjust per repo needs.*
