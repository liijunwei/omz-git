#!/bin/bash

function check-git-diff-files-with-rspec() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  local diff_files=(
    $(git diff $mb_commitid --name-only spec/**/*_spec.rb)
    $(git diff --staged     --name-only spec/**/*_spec.rb)
  )

  if [ ${#diff_files[@]} -eq 0 ]; then
    echo "No files detected"
  else
    set -x
    bundle exec rspec --format=progress ${diff_files[@]}
    set +x
  fi
}

function check-git-diff-files-with-rubocop() {
  local branch=$1
  local mb_commitid=$(git merge-base $branch HEAD)

  local diff_files=(
    $(git diff $mb_commitid --name-only **/*.rb)
    $(git diff --staged     --name-only **/*.rb)
  )

  if [ ${#diff_files[@]} -eq 0 ]; then
    echo "No files detected"
  else
    set -x
    bundle exec rubocop -A ${diff_files[@]}
    set +x
  fi
}
