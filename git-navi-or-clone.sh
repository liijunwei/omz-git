#!/bin/bash
function goto_or_goto_and_clone() {
  local target_dir=$1
  cd "$target_dir"

  local git_repo_url=$2
  if [[ "" != "$git_repo_url" ]]; then
    gcll "$git_repo_url"
  fi

  return 0
}

function out() {
  local repo_url=$1
  goto_or_goto_and_clone "$HOME/OuterGitRepo" "$repo_url"
}
