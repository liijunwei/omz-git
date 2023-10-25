#!/bin/bash

function echo_info() {
  echo "HEAD     -> $(git rev-parse HEAD)"
  echo "HEAD@{u} -> $(git rev-parse HEAD@{u})"
}

# git diff master origin/master
function gdo() {
  echo_info
  git diff HEAD@{u} HEAD
}

function tdo() {
  echo_info
  tig HEAD@{u} HEAD
}

function gdm() {
  if [[ $# == 0 ]]; then
    echo "examples:"
    echo "===================================="
    echo "git diff \$(mb_commitid) --name-only"
    echo "git diff \$(mb_commitid) --shortstat"
    echo "git diff \$(mb_commitid) --stat"
    echo "git diff \$(mb_commitid) --shortstat"
    echo "git diff \$(mb_commitid) --numstat   | sort -hr"
    echo "git diff \$(mb_commitid) --stat"
    echo "git diff --diff-filter=d --name-only \$(mb_commitid) '*.go'"
    echo
  else
    git diff $(mb_commitid) $@ | cat
  fi
}

