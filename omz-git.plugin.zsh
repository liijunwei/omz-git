#!/bin/bash

# Plugin entry
# _omz_git_path=$(dirname $(realpath $BASH_SOURCE)) # on linux
_omz_git_path="$(dirname -- $0)" # on macos

for f in $(ls $_omz_git_path/*.sh); do
  source $f;
done

function omzp() {
  cd $HOME/.oh-my-zsh/custom/plugins
}
