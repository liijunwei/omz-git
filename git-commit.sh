#!/bin/bash

function git-setup-auto-commit-push() {
  watch -n 120 "git pull && git add . && git commit -m 'Commit automatically by watch' && git push"
}

function git-setup-auto-commit() {
  watch -n 120 "git pull && git add . && git commit -m 'Commit automatically by watch'"
}

function c() {
  git add . && git commit -m "Commit manually"
}

unalias gcam 2>/dev/null
function gcam() {
  git commit -v -a --no-edit --amend --allow-empty
}
