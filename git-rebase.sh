#!/bin/bash

function grbu() {
  git rebase HEAD@{u}
}

function grbiu() {
  GIT_EDITOR="gsed -i '2,/^$/s/^pick\b/s/'" git rebase -i HEAD@{u}
}
