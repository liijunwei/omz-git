#!/bin/bash

# on error
# git remote set-head origin --delete
# git remote set-head origin main
# git remote set-head origin master
function remote_default_branch() {
  local remote=$(git rev-parse --abbrev-ref origin/HEAD 2>/dev/null)

  if [ "$remote" = "origin/HEAD" ]; then
    git rev-parse --abbrev-ref upstream/HEAD
  else
    echo $remote
  fi
}

function default_branch() {
  basename $(remote_default_branch)
}

function rdd() {
  git rebase $(default_branch)
}

function de() {
  git checkout $(default_branch)
}

# initially designed for develop/default branch file
function de-file() {
  local filepath=$1
  local final_url="$(repo_http_url)/blob/$(default_branch)/${filepath}"

  echo $final_url
  open $final_url
}

# get merge base commitid
function mb_commitid() {
  git merge-base $(default_branch) HEAD
}
