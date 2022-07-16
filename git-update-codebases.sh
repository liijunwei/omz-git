#!/bin/bash

# Prerequisite:
#   brew install parallel
#   brew install pygitup
function git-update-all-codebases() {
  parallel --timeout 50 --retries 3 "cd {} && echo \"Updating ===> {}\" && git up && echo" ::: $(ls -d */)
}
