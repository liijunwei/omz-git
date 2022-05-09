#!/bin/bash

alias 2='git checkout - && echo && git log | head -n1'
alias c='gaa;gcmsg "Commit manually.";'
alias d='git add . && git diff --staged | tig'
alias fix="gaa;gcmsg 'FIX.';gp;"
alias gbb='git branch -avv | fzf'
alias gcam='git commit -v -a --no-edit --amend --allow-empty'
alias gcob="git checkout -b"
alias gpo='git push origin '
alias groh='git add . && git reset --hard HEAD@{u}'
alias grbu='git rebase HEAD@{u}'
alias grbiu='git rebase -i HEAD@{u}'
alias jj="gaa;gcmsg 'Debugging.';gp;"
alias t="tig"
alias tt='tig --all'
alias s="smerge ."
alias git-setup-auto-commit-push="watch -n 120 \"git pull && git add . && git commit -m 'Commit automatically by watch.' && git push\""
alias git-setup-auto-commit="watch -n 120 \"git pull && git add . && git commit -m 'Commit automatically by watch.'\""
unalias gl
alias gl="git up"
