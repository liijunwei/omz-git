#!/bin/bash

function git-make-rollback() {
  local rollback_branch_name="$(date "+rollback-%Y%m%d-%H%M")"
  git checkout -b ${rollback_branch_name}
  local current_branch=$(git rev-parse --abbrev-ref HEAD)

  echo "Rollback Branch Name: ${rollback_branch_name}"
  echo "Current Branch Name: ${current_branch}"
  echo "====================================="

  git push --set-upstream origin ${current_branch}
  git status
}

function get-commit-message-by-commit-id() {
  local commit_id=$1
  git log --format=%B -n 1 $commit_id | cat
}

# Get first N commit ids, for cherry-pick use
function get-0-to-N-commits() {
  local commit_id=$1
  echo "找出 $(git rev-parse --abbrev-ref HEAD) 分支最新的 (0..$commit_id) commits"

  for i in {0..$commit_id}; do
    local commit_id=$(git rev-parse  HEAD~$i)
    echo "git cherry-pick $commit_id ; # 第 $i 个 $(get-commit-message-by-commit-id $commit_id)"
  done
}

function git-show-commit-files() {
  local commit_id=$1

  if [ -z "${commit_id}" ]; then
    local commit_id=$(git rev-parse --abbrev-ref HEAD)
  fi

  git show --pretty="" --name-only $commit_id | cat
}
