#!/bin/bash

function git-fork-point-of() {
  local branch=${1:-develop}
  git merge-base --fork-point $branch
}
