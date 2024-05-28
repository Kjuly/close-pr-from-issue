#!/bin/bash

set -e

output="$(./scripts/get_pr_number_from_issue_comment.sh "$(cat ./scripts/samples/debug_sample_issue_comment_body.md)" 1)"

if [ "$output" != "PR NUMBER: 123" ]; then
  echo "ERROR: Invalid PR Number Results: $output"
  exit 1
fi

echo "OK."
