#!/bin/bash

function git-squash-to-merge-base() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  GIT_EDITOR="gsed -i '2,/^$/s/^pick\b/s/'" git rebase -i $mb_commitid
}

# work along with ./Rakefile
function rddd() {
  local mode=$1

  if [[ "" == "$mode" ]]; then
    echo "example:"
    echo "  rddd rebase"
    echo "  rddd reset"
    echo "  rddd force_push"
    return 1
  fi

  bundle exec rake -f ~/.oh-my-zsh/custom/plugins/omz-git/Rakefile rebase_branches mode=$mode
}
