#!/bin/bash

alias 2='git checkout - && echo && git log | head -n1'

function gbbc() {
  git checkout $(git branch -vv | fzf | awk '{print $1}')
}

function gcob() {
  git checkout -b
}
