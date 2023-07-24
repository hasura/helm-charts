# Contributing

## Code of conduct

Please follow our [Code of Conduct](code-of-conduct.md) in the context of any contributions made to Hasura.

## Ways of contributing

### Reporting an Issue

- Make sure you test against the latest released version. It is possible that we may have already fixed the bug you're
  experiencing.

- Please include logs of Helm or Kubernetes if relevant.

- Create a [issue](https://github.com/hasura/helm-charts/issues/new/choose).

### Working on an issue

- We use the [fork-and-branch git workflow](https://blog.scottlowe.org/2015/01/27/using-fork-branch-git-workflow/).

- Please make sure there is an issue associated with the work that you're doing.

- If you're working on an issue, please comment that you are doing so to prevent duplicate work by others also.

- Squash your commits and refer to the issue using `fix #<issue-no>` or `close #<issue-no>` in the commit message, at
  the end. For example: `resolve answers to everything (fix #42)` or `resolve answers to everything, fix #42`

- Rebase master with your branch before submitting a pull request.

## Commit messages

- The first line should be a summary of the changes, not exceeding 50 characters, followed by an optional body which has
  more details about the changes. Refer to [this link](https://github.com/erlang/otp/wiki/writing-good-commit-messages)
  for more information on writing good commit messages.

- Use the imperative present tense: "add/fix/change", not "added/fixed/changed" nor "adds/fixes/changes".

- Don't capitalize the first letter of the summary line.

- Don't add a period/dot (.) at the end of the summary line.

## Release process

The release process is automatic with [Github Action](.github/workflows/release.yaml). To release new helm chart versions, you need to:
- Create a new branch with the prefix `release-*`.
- Increase versions in `Chart.yaml` files that have new changes.
- Push the new commit.

The workflow will compare changes of `charts/**/Chart.yaml` files between the release branch and `main` and release changed versions only.
