#!/bin/bash

function git-setup-auto-commit-push() {
  echo "AUTO_COMMIT_INTERVAL=5 git-setup-auto-commit-push # Use this if you want to customize interval, default 300s"
  local interval=${AUTO_COMMIT_INTERVAL:-300}
  watch -n $interval "git pull && git add . && git commit -m 'Commit automatically by watch' && git push"
}

function git-setup-auto-commit() {
  echo "AUTO_COMMIT_INTERVAL=5 git-setup-auto-commit # Use this if you want to customize interval, default 300s"
  local interval=${AUTO_COMMIT_INTERVAL:-300}
  watch -n $interval "git pull && git add . && git commit -m 'Commit automatically by watch'"
}

function c() {
  git add . && git commit -m "Commit manually"
}

function ap() {
  git add . && git commit -m "Apply suggestions from code review"
}

function am() {
  git commit -v --amend --allow-empty
}

unalias gcam 2>/dev/null
function gcam() {
  git commit -v -a --no-edit --amend --allow-empty
}
