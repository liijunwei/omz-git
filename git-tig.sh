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
