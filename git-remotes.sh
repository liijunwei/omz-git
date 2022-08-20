#!/bin/bash

# remove old remote and add new remote
# e.g. git-change-remote-repo git@github.com:your-username/custom-omz-plugins.git
function git-change-remote-repo() {
  local neworigin=$1

  echo "remote info(before)"
  echo "=================="
  git remote -v
  echo

  echo "removing old origin..."
  git remote remove origin
  echo "adding old origin..."
  git remote add origin "$neworigin"
  echo

  git branch -u origin/$(git rev-parse --abbrev-ref HEAD)

  echo "remote info(after)"
  echo "=================="
  git remote -v
  echo
}
