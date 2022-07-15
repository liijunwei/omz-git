#!/bin/bash

alias 2='git checkout - && echo && git log | head -n1'

function gbbc() {
  local keyword=$1
  if [[ "" == "$keyword" ]]; then
    git checkout $(git branch -vv | fzf | awk '{print $1}')
  else
    git checkout $(git branch -vv | fzf -q $keyword | awk '{print $1}')
  fi
}

function gcob() {
  local branch_name=$1
  git checkout -b $branch_name
}
