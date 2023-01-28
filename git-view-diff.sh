#!/bin/bash

# Note: feature branch need to rebase develop in a regular basis

function v() {
  local keyword=${1:-""}

  $CORE_EDITOR $(git diff $(mb_commitid) --name-only | fzf -q "$keyword" --preview 'bat --style=numbers --color=always --line-range :500 {}')
}

function va() {
  $CORE_EDITOR $(git diff $(mb_commitid) --name-only)
}

function vc() {
  git diff $(mb_commitid) --name-only | cat
}
