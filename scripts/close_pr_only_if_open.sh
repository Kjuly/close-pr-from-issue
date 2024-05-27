#!/bin/bash

if [ -z "$1" ]; then
  echo "::error:: The PR_NUMBER is required."
  exit 1
fi

if [ -z "$2" ]; then
  echo "::error:: The ISSUE_NUMBER is required."
  exit 1
fi

PR_NUMBER=$1
ISSUE_NUMBER=$2
DELETE_BRANCH=$3

[ "$DELETE_BRANCH" = "true" ] && should_delete_branch='1'

open_pr_id="$(gh pr list -s open --json number --jq '.[] | .number' | grep "^$PR_NUMBER$")"
echo "open_pr_id: $open_pr_id"

if [ -n "$open_pr_id" ] && [ "$open_pr_id" = "$PR_NUMBER" ]; then
  echo "Execute gh command to close the PR #$PR_NUMBER."
  gh pr close "$PR_NUMBER" ${should_delete_branch:+-d} -c "This PR is closed due to a closed issue #$ISSUE_NUMBER."

  echo "closed=1" >> "$GITHUB_OUTPUT"
fi
