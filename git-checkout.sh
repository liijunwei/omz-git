#!/bin/bash

alias 2='git checkout - && echo && git log | head -n1'

function gbbc() {
  local keyword=${1:-""}
  git checkout $(git branch -vv | fzf -q "$keyword" | awk '{print $1}')
}

function gcob() {
  local branch_name=$1
  git checkout -b $branch_name
}
