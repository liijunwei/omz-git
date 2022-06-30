#!/bin/bash

function gpo() {
  git push origin $1
}

function gbb() {
  git branch -v | fzf
}
