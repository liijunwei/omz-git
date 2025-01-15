#!/bin/bash

function git-squash-to-merge-base() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  GIT_EDITOR="gsed -i '2,/^$/s/^pick\b/squash/'" git rebase -i $mb_commitid
}

function git-squash-to-merge-base-v2() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  GIT_EDITOR="gsed -i '2,/^$/s/^pick\b/fixup/'" git rebase -i $mb_commitid
}

# work along with https://github.com/liijunwei/rebase_pusher
function rddd() {
  rebase_push $@
}
