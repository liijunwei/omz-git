#!/bin/bash

function git-list-tags-with-date() {
  git log --tags --simplify-by-decoration --pretty="format:%ci %d"
}
