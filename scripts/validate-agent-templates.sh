#!/usr/bin/env bash
set -e

exit_code=0

# Validate template files under templates/ (ensure required frontmatter keys are present)
template_files=$(git ls-files 'templates/*.md' || true)
for f in $template_files; do
  echo "\nValidating template: $f"

  # Check for required keys anywhere in the file (templates are allowed to contain placeholders)
  for key in "description:" "name:" "tools:" "handoffs:"; do
    if ! grep -qF "$key" "$f"; then
      echo "ERROR: missing required key '$key' in template $f"
      exit_code=1
    fi
  done

done

# Validate actual agent files (any tracked *.agent.md) to ensure placeholders have been replaced
agent_files=$(git ls-files '*.agent.md' || true)
for f in $agent_files; do
  # Skip the main DeBaun-Coder agent file which intentionally documents placeholders
  if [ "$(basename "$f")" = "DeBaun-Coder.agent.md" ]; then
    echo "\nSkipping example agent file: $f"
    continue
  fi

  echo "\nChecking agent file for placeholders: $f"
  if grep -q "\[repo-name\]\|\[RepoName\]" "$f"; then
    echo "ERROR: placeholders [repo-name] or [RepoName] remain in agent file $f"
    exit_code=1
  fi

done

if [ $exit_code -ne 0 ]; then
  echo "\nTemplate validation FAILED"
  exit $exit_code
else
  echo "\nTemplate validation passed"
fi
