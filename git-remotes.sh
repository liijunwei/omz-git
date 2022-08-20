#!/bin/bash

# remove old remote and add new remote
# e.g. git-change-remote-repo git@github.com:your-username/custom-omz-plugins.git
function git-change-remote-repo() {
  local neworigin=$1

  echo "remote info(before)"
  echo "=================="
  git remote -v
  echo

  git remote remove origin
  git remote add origin "$neworigin"

  echo "remote info(after)"
  echo "=================="
  git remote -v
  echo
}
