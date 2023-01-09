#!/bin/bash

function d() {
  git add . && git diff --staged | tig
}

function t() {
  tig
}

function tt() {
  tig --all
}

function tb() {
  local keyword=$1
  tig blame $keyword
}

function tig-view-commits-of() {
  local author=${1:-""}
  local myself=$(git config --get user.email)
  local sort_option="--date-order" # ref: https://github.com/jonas/tig/issues/497

  if [[ $author = "" ]]; then
    author="$myself"
  fi

  set -x
  tig --author="$author" $sort_option
  set +x
}
