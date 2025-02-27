#!/bin/bash

unalias gl 2>/dev/null
function gl() {
  git up
}

function gll() {
  git up --no-fetch
}

func glld() {
  git up --no-fetch | grep 'error: remote branch doesn' | awk '{print $1}' | xargs -I {} git branch -D {}
}
