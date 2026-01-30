# Repo Agent Creation Workflow

This document contains the detailed workflow for creating repository-specific agents — copied from `DeBaun-Coder.agent.md` for maintainability and discoverability.

## 1. Ensure Work Item Exists

**Always start from a GitHub Issue.** Before creating an agent ad-hoc:

- Check if there's an issue for the repo setup in `bryan-debaun/work-tracking`.
- If not, offer to create one:

  ```powershell
  gh issue create --repo bryan-debaun/work-tracking --title "Set up [repo-name] repository" --body "..." --label "project:[name],type:setup,priority:high"
  ```

- Include "Create repo-specific coding agent" as a task checkbox in the issue
- **ASK the user**: "I don't see an issue for setting up this repo. Should I create one before we proceed?"

## 2. Ensure Repository Exists and Is Open

- **Check if repo exists**:

  ```powershell
  gh repo view bryan-debaun/[repo-name] --json name 2>$null
  ```

- **Determine public vs private**: Discuss visibility and recommend public/private per guidance.
- **Create if needed**:

  ```powershell
  # For public repos:
  gh repo create [repo-name] --public --description "[description]" --clone
  
  # For private repos:
  gh repo create [repo-name] --private --description "[description]" --clone
  ```

- **Protect the main branch** (public repos only): set branch protection rules to prevent force pushes while allowing the repo admin to merge.
- **Verify workspace**: Confirm the repo is the currently open workspace in VS Code and guide the user to open it if needed.

## 3. Analyze the Repository

- Detect tech stack (package.json, *.csproj, requirements.txt).
- Identify established patterns, CI/CD setup, test frameworks, and dependencies.
- Read README and other project docs.

## 4. Identify Repo-Specific Focus Areas

Use the project analysis to determine what the repo-specific agent should emphasize (web API, SPA, CLI, library, etc.).

## 5. Create the Agent File

Create the agent file under `.github/agents/` and follow the template conventions:

```
[repo-name]/
└── .github/
    └── agents/
        ├── [repo-name]-coder.agent.md
        ├── [repo-name]-tester.agent.md
        ├── [repo-name]-support.agent.md
        └── [repo-name]-reviewer.agent.md
```

- Use templates from `https://github.com/bryan-debaun/copilot-agents/tree/main/templates/`.
- Validate placeholders are replaced and run the validator script if present.

## Handoff Flow & Example

For handoffs between agents (coding → testing → reviewer → support), ensure each handoff includes Context, Related Issue, Files Changed, Acceptance Criteria, and suggested branch.

Example handoff snippet (brief):

```
Handoff: Issue #123 (Add background worker for invoice processing)
ADR: /docs/adr/0005-invoice-worker.md
Diagrams: /design/invoice-worker.png
Acceptance: Process 95% invoices <200ms in representative benchmark
Tasks:
 - Create worker project and API
 - Add queueing and retry logic
 - Add integration tests and benchmarks
Labels: project:billing, type:feature, priority:high
Suggested branch: feature/123-invoice-worker
Spike branch: spike/invoice-worker-benchmark (benchmark results attached)
```

---

For the authoritative, step-by-step workflow and templates, see `https://github.com/bryan-debaun/copilot-agents/tree/main/docs/agent-templates.md` and `https://github.com/bryan-debaun/copilot-agents/tree/main/templates/`.
