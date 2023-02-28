#!/bin/bash

function git-setup-auto-commit-push() {
  echo "AUTO_COMMIT_INTERVAL=5 git-setup-auto-commit-push # Use this if you want to customize interval, default 300s"
  local interval=${AUTO_COMMIT_INTERVAL:-300}
  watch -n $interval "git add . && git commit -m 'Commit automatically by watch' && git push"
}

function git-setup-auto-commit() {
  echo "AUTO_COMMIT_INTERVAL=5 git-setup-auto-commit # Use this if you want to customize interval, default 300s"
  local interval=${AUTO_COMMIT_INTERVAL:-300}
  watch -n $interval "git add . && git commit -m 'Commit automatically by watch'"
}

# private api
function _quick_commit() {
  local default_msg=$1
  local extra_commit_msg=$2

  if [ -z "${extra_commit_msg}" ]; then
    git commit --allow-empty -m "$default_msg"
  else
    git commit --allow-empty -m "$default_msg: $extra_commit_msg"
  fi

  return 0
}

function c() {
  local commit_msg=$1
  git add .
  _quick_commit "Commit manually" $commit_msg
}

function wi() {
  local commit_msg=$1
  git add .
  _quick_commit "[SKIP CI] WIP" $commit_msg
}

function ccc() {
  local commit_msg=$1
  git add .
  _quick_commit "Code cleanup" $commit_msg
}

function ap() {
  local commit_msg=$1
  _quick_commit "Apply suggestions from code review" $commit_msg
}

function am() {
  git commit -v --amend --allow-empty
}

unalias gcam 2>/dev/null
function gcam() {
  git commit -v --no-edit --amend --allow-empty
}
