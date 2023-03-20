#!/bin/bash

function git-revert-changes-in() {
  git checkout $(default_branch) -- $@
}
