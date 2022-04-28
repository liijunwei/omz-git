#!/bin/bash

# Prerequisite:
#   brew install parallel
#   brew install pygitup
function update-all-codebases() {
  parallel --timeout 30 --retries 3 "cd {} && echo \"Updating ===> {}\" && git up && echo" ::: $(ls -d */)
}
