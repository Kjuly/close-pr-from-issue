#!/bin/bash

if [ -z "$1" ]; then
  echo "::error:: The issue comment body is required."
  exit 1
fi
INPUT_ISSUE_COMMENT_BODY=$1
LOCAL_DEBUG=$2

pr_number="$(echo "$INPUT_ISSUE_COMMENT_BODY" | grep 'tracked at PR #' | grep -m 1 -Eo '[0-9]*')" # | head -1
echo "PR NUMBER: $pr_number"

if [ -z "$LOCAL_DEBUG" ]; then
  echo "pr_number=$pr_number" >> "$GITHUB_OUTPUT"
fi
