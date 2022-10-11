#!/bin/bash

function gpo() {
  git push origin $1
}

function gbb() {
  git branch -vv | fzf
}

function gbbb() {
  git branch -vva | fzf
}

function git-get-repo-default-branch() {
  git rev-parse --abbrev-ref origin/HEAD
}
