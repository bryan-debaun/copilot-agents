# Terminal & Shell Guidance — PowerShell-focused

This guidance explains how agents and scripts should prepare and run terminal commands in this repository's environment (Windows PowerShell, PowerShell 5.1). Its goal is to avoid execution errors caused by POSIX-style constructs and to make command execution consistent and testable.

## Execution environment

- Commands executed via VS Code terminals and `runInTerminal` are run in **Windows PowerShell** (PowerShell 5.1) by default.
- Assume PowerShell syntax and conventions when preparing commands.

## Why this matters

- POSIX artifacts such as `&&` and `true;` are not valid PowerShell constructs and can cause command failures or unexpected behavior.
- Commands copied from POSIX-centric guides or CI snippets often include constructs that break when executed in PowerShell shells.

## Guidelines

- Use semicolons (`;`) to chain commands on one line when needed: `Write-Output 'Done'; exit 0`.
- Prefer explicit exit codes (e.g., `exit 0`) over POSIX shorthands like `true;`.
- Avoid `&&` and other POSIX-only operators in commands targeted at PowerShell terminals.
- Don't embed POSIX shebangs (e.g., `#!/bin/sh`) or `/bin/sh` references in command files intended to run in PowerShell.
- Test commands interactively in a local PowerShell terminal before invoking them through automation.

## Validation

- Use `agent-artifacts/validate-terminal.ps1 <file>` to lint files that contain terminal commands and detect common POSIX artifacts. The linter checks for `&&`, `true;`, and `/bin/sh` references and fails with helpful messages.
- Add the terminal linter to any automation that will run commands on developer machines or in local CI where PowerShell is the executor.

## Examples

Wrong (POSIX-style):

```bash
echo "Done" && true;
```

Right (PowerShell):

```powershell
Write-Output 'Done'; exit 0
```

## Best practices for `runInTerminal`

- Prefer passing single, self-contained PowerShell commands to `runInTerminal` that do not rely on POSIX chaining.
- When needing to run multiple steps, use a script file (PowerShell `.ps1`) and validate it with the terminal linter before executing.
- Keep commands idempotent where possible and use explicit exit codes to indicate success/failure.

## Links

- Terminal linter: <https://github.com/bryan-debaun/copilot-agents/tree/main/agent-artifacts/validate-terminal.ps1>
- Validation guidance for Markdown drafts: <https://github.com/bryan-debaun/copilot-agents/tree/main/agent-artifacts/validate-markdown.ps1>

---

If you'd like, I can add CI or GitHub Action examples that run the terminal validation and fail PRs where POSIX artifacts are detected.
