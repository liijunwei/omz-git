#!/bin/bash

function git-list-emails-of-current-branch() {
  git shortlog --summary --numbered --email
}

function git-list-emails-of-all-branch() {
  git shortlog --summary --numbered --email --all
}
