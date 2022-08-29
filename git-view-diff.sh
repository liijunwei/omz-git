#!/bin/bash

# Note: feature branch need to rebase develop in a regular basis

function v() {
  local keyword=${1:-""}
  local fork_point=$(git-fork-point-of develop)

  $CORE_EDITOR $(git diff $fork_point --name-only | fzf -q "$keyword" --preview 'bat --style=numbers --color=always --line-range :500 {}')
}

function va() {
  local fork_point=$(git-fork-point-of develop)
  $CORE_EDITOR $(git diff $fork_point --name-only)
}
