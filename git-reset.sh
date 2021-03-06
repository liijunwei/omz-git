#!/bin/bash

unalias groh 2>/dev/null
function groh() {
  git add . && git reset --hard HEAD@{u}
}

function git-cleanup() {
  git add . && git reset --hard $(git rev-parse HEAD)
}
