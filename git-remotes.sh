#!/bin/bash

function git-change-origin-repo() {
  local neworigin=$1

  if [ ! -z "$neworigin" ]; then
    git remote rename origin upstream
    echo "---------------------------------------------"
    git branch -avv | cat
    git remote add origin $neworigin
  fi

  cat <<EOF

USAGE:
  git-change-origin-repo
  git-change-origin-repo your-new-origin

Sync fork by:
  git checkout main && git pull

Develop on your fork by:
  git checkout newFeatureBranch
  # commit your changes
  # sync fork
  git rebase main
  git push --force
  # make a pull request

EOF
}
