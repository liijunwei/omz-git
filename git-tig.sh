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
  tig blame
}

function tig-view-commits-of() {
  local author=${1:-""}
  local myself=$(git config --get user.email)

  if [[ $author = "" ]]; then
    author="$myself"
  fi

  set -x
  tig --author="$author"
  set +x
}
