# GitHub Interactions — Markdown-first guidance

This document defines how agents should author and post semantic content to GitHub (issues, PR descriptions, PR comments). Its purpose is to ensure readability, avoid accidental JSON payloads, and provide repeatable validation and submission practices.

## Principles

- Always author human-facing content in **Markdown**, not JSON.
- Use short subject lines and a one-line summary at the top of every draft.
- Prefer file-based submission (e.g., `gh --body-file <path>`) to avoid JSON/escaping errors and to keep drafts auditable.
- Keep machine-readable metadata separate (e.g., `agents/metadata.yml`), not embedded in issue bodies.

## Recommended layout for drafts

- Subject (one line)
- Summary (1–2 sentences)
- Background / Context (optional)
- Goals & Acceptance Criteria (use `- [ ]` checkboxes)
- Tasks / Implementation Notes (optional)
- Links / References (ADRs, diagrams, related issues)

## Storage & Naming

- Save drafts in `agent-artifacts/` under logical subfolders:
  - `agent-artifacts/issues/issue-<id>-body.md`
  - `agent-artifacts/prs/pr-<id>-body.md`
  - `agent-artifacts/prs/pr-<id>-comment.md`
  - `agent-artifacts/templates/<purpose>.md`
- Use clear names that include issue or PR numbers where applicable.

## Validation

- Use the local validation script before posting: `agent-artifacts/validate-markdown.ps1 <file>` (<https://github.com/bryan-debaun/copilot-agents/tree/main/agent-artifacts/validate-markdown.ps1>).
- Validation should fail on obvious JSON-like content and require a human-friendly rewrite.

## Posting (examples)

- Create issue: `gh issue create --repo owner/repo --title "Short title" --body-file agent-artifacts/issues/issue-123-body.md`
- Edit issue: `gh issue edit 123 --repo owner/repo --body-file agent-artifacts/issues/issue-123-body.md`
- PR comment: `gh pr comment 123 --repo owner/repo --body-file agent-artifacts/prs/pr-123-comment.md`

## Do's & Don'ts (high level)

Do:

- Use Markdown with a short summary first and task checkboxes (`- [ ]`).
- Save drafts to `agent-artifacts/` and validate before posting.
- Use `--body-file` or equivalent tools to submit drafts.

Don't:

- Embed JSON objects or machine-readable metadata in issue/PR bodies.
- Post raw JSON or JSON-like drafts without validation.
- Rely on ad-hoc string substitution for content that needs review.

## Automation & CI

- When automation needs to create GitHub content (e.g., CI-generated release notes), prefer generating Markdown files and letting a human review and post them, or use authenticated automation that creates content with clear templates.
- If a repository enforces template validation, run the validator in CI (example: `bash ./scripts/validate-agent-templates.sh`) and fail PRs on validation errors.

## Links

- `agent-artifacts/validate-markdown.ps1` — local validation script: <https://github.com/bryan-debaun/copilot-agents/tree/main/agent-artifacts/validate-markdown.ps1>
- Agent templates: <https://github.com/bryan-debaun/copilot-agents/tree/main/docs/agent-templates.md>

---

If you need additional examples, or want a stricter linter rule-set, we can add more validation checks to `agent-artifacts/validate-markdown.ps1` or create a GitHub Action to enforce Markdown-only content in issue/PR bodies.
