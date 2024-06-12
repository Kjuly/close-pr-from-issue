# close-pr-from-issue
Github Action to close the PR when the related issue is closed.

## Usage

```yaml
on:
  issues:
    types: [closed]

# See the "Workflow Permissions" section below for details.
permissions:
  contents: write
  issues: write
  pull-requests: write

jobs:
  close-pr-from-issue:
    runs-on: ubuntu-latest
    steps:
      - name: Close PR from Issue
        uses: kjuly/close-pr-from-issue@main
```

## Optional Inputs

| Options (with) | Default | Description
| :--- | :--- | :--- |
| issue_comment_key | 'tracked at PR #' | The key string of relevant comments that mention the PR.
| delete_branch | 'true' | Whether to delete the branch after closing, default: 'true'.
| leave_comment_on_issue | 'true' | Whether to comment on the issue after the relevant PR is closed.
| skip_checkout | 'false' | Whether caller workflow repo checkout should be skipped. If you've done this in the caller workflow, set this to 'true' to skip duplicate work.
| token | ${{github.token}} | Github token or PAT. Only required if you need to access a private repo under the same user/org scope.

## Workflow Permissions

| Scope | Permission | Description
| :--- | :--- | :---
| contents | read | Checkout the repo.
| contents | write | Delete the branch to merge, required when `delete_branch = 'true'`.
| issues | write | Leave a comment on the issue, required when `leave_comment_on_issue = 'true'`.
| pull-requests | write | Close PR, required.

Permissions setting is only needed if your repo has restricted permissions on the `GITHUB_TOKEN`.

You can confirm your repo's workflow permissions in 

> Settings > Code and automation > Actions > General > Workflow permissions
