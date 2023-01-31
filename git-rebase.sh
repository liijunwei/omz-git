#!/bin/bash

function git-squash-to-merge-base() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  GIT_EDITOR="gsed -i '2,/^$/s/^pick\b/s/'" git rebase -i $mb_commitid
}
