#!/bin/bash

# TODO refactoring based on https://github.blog/2014-10-13-linking-merged-pull-requests-from-commits/
function git-find-pull-request() {
  local keyword=$1
  local first_commitid=$(git log --pretty="format:%H" -S "$keyword" | tail -n1)

  git-view-in-web $first_commitid
}
