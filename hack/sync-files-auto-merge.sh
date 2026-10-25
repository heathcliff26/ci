#!/bin/bash

set -e

PR_BRANCH="repo-sync/ci/main"

repos="$(gh repo list --no-archived --source --json nameWithOwner | jq -r '.[] | .nameWithOwner')"
echo "${repos}" | while read -r repo; do
    pr="$(gh pr list -H "${PR_BRANCH}" --repo "${repo}" --json number --jq '.[0].number')"
    if [ -z "${pr}" ]; then
        continue
    fi
    echo "Trying PR #${pr} in ${repo}"
    gh pr merge --auto -d -r --repo "${repo}" "${pr}"
done
