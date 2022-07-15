#!/bin/bash

function v() {
  local keyword=$1
  if [[ "" == "$keyword" ]]; then
    $CORE_EDITOR $(git diff develop --name-only | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
  else
    $CORE_EDITOR $(git diff develop --name-only | fzf -q $keyword --preview 'bat --style=numbers --color=always --line-range :500 {}')
  fi
}
