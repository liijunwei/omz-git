#!/bin/bash

unalias gl 2>/dev/null
function gl() {
  git up
}

function gll() {
  git up --no-fetch
}
