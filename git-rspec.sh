#!/bin/bash

function rspec-run-diff-files() {
  local param_base=$1
  local default_base="origin/develop"
  local base=${param_base:-"$default_base"}

  local diff_files=(
    $(git diff --merge-base $base --name-only spec/**/*_spec.rb)
    $(git diff --staged           --name-only spec/**/*_spec.rb)
  )

  bundle exec rspec ${diff_files[@]}
}