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

function tig-view-my-commits() {
  tig --all --author="$(git config --get user.email)"
}
