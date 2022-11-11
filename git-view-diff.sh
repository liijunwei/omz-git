#!/bin/bash

# Note: feature branch need to rebase develop in a regular basis

function v() {
  local keyword=${1:-""}
  local mb_commitid=$(git merge-base develop HEAD)

  $CORE_EDITOR $(git diff $mb_commitid --name-only | fzf -q "$keyword" --preview 'bat --style=numbers --color=always --line-range :500 {}')
}

function va() {
  local mb_commitid=$(git merge-base develop HEAD)
  $CORE_EDITOR $(git diff $mb_commitid --name-only)
}

function vc() {
  local mb_commitid=$(git merge-base develop HEAD)
  git diff $mb_commitid --name-only | cat
}
