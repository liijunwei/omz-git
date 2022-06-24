#!/bin/bash

function gpo() {
  git push origin
}

function gbb() {
  git branch -v | fzf
}
