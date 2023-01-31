#!/bin/bash

function git-find-pull-request() {
  local keyword=$1
  local first_commitid=$(git log --pretty="format:%H" -S "$keyword" | tail -n1)

  echo "commitid found: $first_commitid"

  open "$(repo_http_url)/search?q=is:merged ${first_commitid}&type=issues"
}
