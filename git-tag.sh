#!/bin/bash

function git-list-tags-with-date() {
  git log --tags --simplify-by-decoration --pretty="format:%ci %d"
}

function lt() {
  git checkout $(git describe --tags --abbrev=0)
}

