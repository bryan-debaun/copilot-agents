# Agent Templates — Usage & Validation

## Quick TL;DR — Apply a template

1. Copy the template from `./templates/` → `.github/agents/[repo-name]-[role].agent.md`
2. Replace placeholders: `[repo-name]` for machine IDs, `[RepoName]` for display names
3. Add repo-specific frontmatter values (see "Required frontmatter fields")
4. Run the validator (local script or CI) to ensure no placeholders remain
5. Create a feature branch, commit, and open a draft PR

---

## How to use a template (detailed)

1. Copy the relevant template from `./templates/` into the target repo as `.github/agents/[repo-name]-[role].agent.md`.
2. Replace placeholders:
   - Use `[repo-name]` for machine identifiers (file names, CI job names)
   - Use `[RepoName]` for public-facing display names (used in `name:` and `handoffs.agent` fields)
3. Keep the frontmatter as a fenced markdown block (```markdown ...```) so it's easy to copy/paste; **close the fenced block above the Customization notes** (this keeps the actionable template body separate and copy-friendly).
4. Add any repo-specific frontmatter fields the agent will need (e.g., `buildCommand`, `testCommand`, `coverageTarget`, `docsFolder`).
5. Validate placeholders are replaced before committing (example: `git grep -n "\[repo-name\]\|\[RepoName\]" || true`) or run the validator script in `./scripts/`.
6. Create a feature branch, commit the new agent file, run a quick lint/check, and open a draft PR for review.

## Required frontmatter fields (recommended)

- `description` (string): brief description of the agent
- `name` (string): display name (use `[RepoName] <Role>`)
- `tools` (list): tools the agent needs (e.g., `read/readFile`, `execute/runInTerminal`)
- `handoffs` (list): handoff definitions with `label`, `agent`, and `prompt`

## Validation & CI recommendation

- Add `./scripts/validate-agent-templates.sh` to PRs and optionally run it via a GitHub Action at `.github/workflows/validate-templates.yml`. The validator should:
  - Ensure required frontmatter keys are present
  - Fail if leftover placeholders (`[repo-name]` or `[RepoName]`) are found
  - Exit non-zero on failures, making PRs fail until fixed

Example CI step:

```yaml
- name: Validate agent templates
  run: bash ./scripts/validate-agent-templates.sh
```

## Best Practices & Conventions

- Use display names for `handoffs.agent` (e.g., "MyRepo Coder") so handoffs are human-readable.
- Ensure handoff prompts require Context, Related Issue, Files Changed, and Acceptance Criteria to make automated handoffs actionable.
- Keep templates concise and prefer explicit commands in examples to reduce ambiguity.

## Agent instructions source

This repository's `./DeBaun-Coder.agent.md` (and the templates under `./templates/`) are the authoritative, version-controlled sources for repo-specific agent configurations and handoff patterns. When clarifying behavior or resolving ambiguity, prefer updating these files via a PR with a concise summary and rationale.
