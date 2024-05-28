# close-pr-from-issue
Github Action to close the PR when the related issue is closed.

## Usage

```yaml
on:
  issues:
    types: [closed]

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
