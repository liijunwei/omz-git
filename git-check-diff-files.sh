#!/bin/bash

function check-git-diff-files-with() {
  local param_gem=$1
  local param_base=$2
  local default_base="origin/develop"
  local base=${param_base:-"$default_base"}

  case $param_gem in
    rspec)
      local diff_files=(
        $(git diff --merge-base $base --name-only spec/**/*_spec.rb)
        $(git diff --staged           --name-only spec/**/*_spec.rb)
      )
      bundle exec rspec ${diff_files[@]}
      ;;
    rubocop)
      local diff_files=(
        $(git diff --merge-base $base --name-only *.rb)
        $(git diff --staged           --name-only *.rb)
      )
      bundle exec rubocop -A ${diff_files[@]}
      ;;
    *)
      echo "gem $param_gem not supported"
      ;;
  esac
}
