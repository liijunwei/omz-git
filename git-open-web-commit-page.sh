#!/bin/bash

function git-view-in-web() {
  local branch_or_commit_id=$1
  local currentbranch=$(git rev-parse --abbrev-ref HEAD)
  local branch=${branch_or_commit_id:-"$currentbranch"}

  local commit=$(git rev-parse $branch)
  local repo_url="$(repo_http_url)/commit/${commit}"

  cat <<EOF

USAGE: git-view-in-web branch (flag)
-------------------------------------------------------------
cd \$HOME/OuterGitRepo/rails
git-view-in-web demobranch_123   # Show HEAD commit in browser, for code review.
git-view-in-web demobranch_123 x # Show branch \`demobranch_123\` info only, for link sharing.
-------------------------------------------------------------
${repo_url};

EOF

  local open_in_web_tag=$2
  [[ -z "$open_in_web_tag" ]] && open $repo_url
}
