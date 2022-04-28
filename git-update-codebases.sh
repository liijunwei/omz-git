#!/bin/bash

# Prerequisite:
#   brew install parallel
#   brew install pygitup
function update-all-codebases() {
  ls -d */ | parallel "cd {} && echo \"\e[1;31m[Updating {}]\e[0m\" && git up && echo"
}
