#!/usr/bin/env bash
set -e

exit_code=0

# Find agent files tracked in the repo
files=$(git ls-files '*.agent.md' || true)
if [ -z "$files" ]; then
  echo "No .agent.md files tracked in this repo."
  exit 0
fi

for f in $files; do
  echo "\nValidating: $f"

  # Check for required keys anywhere in the file
  for key in "description:" "name:" "tools:" "handoffs:"; do
    if ! grep -qF "$key" "$f"; then
      echo "ERROR: missing required key '$key' in $f"
      exit_code=1
    fi
  done

  # Check for leftover placeholders
  if grep -q "\[repo-name\]\|\[RepoName\]" "$f"; then
    echo "ERROR: placeholders [repo-name] or [RepoName] remain in $f"
    exit_code=1
  fi

done

if [ $exit_code -ne 0 ]; then
  echo "\nTemplate validation FAILED"
  exit $exit_code
else
  echo "\nTemplate validation passed"
fi
