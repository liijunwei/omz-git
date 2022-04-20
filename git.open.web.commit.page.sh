#!/bin/bash

function git-view-in-web() {
  local project_abs_path=$(git rev-parse --show-toplevel)

  local branch_or_commit_id=$1
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local branch_name=${branch_or_commit_id:-"$current_branch"}

  local commit=$(git rev-parse $branch_name)
  local repo_http_url=$(get_repo_http_url)
  local repo_without_dot_git=$(dirname $repo_http_url)/$(basename $repo_http_url .git)
  local final_url="${repo_without_dot_git}/commit/${commit}"

  cat <<EOF

USAGE: git-view-in-web branch (flag)
-------------------------------------------------------------
cd \$HOME/OuterGitRepo/rails
git-view-in-web demobranch_123   # Show HEAD commit in browser, for code review.
git-view-in-web demobranch_123 x # Show branch \`demobranch_123\` info only, for link sharing.
-------------------------------------------------------------
${final_url};

EOF

  local open_in_web_tag=$2
  [[ -z "$open_in_web_tag" ]] && open $final_url;
}

# https://github.com/monacohq/monaco-rails/tree/chore/update_pry__silent-warning
function git-view-branch-in-web() {
  local branch=$1
  local current_branch=$(git rev-parse --abbrev-ref HEAD)
  local branch_name=${branch:-"$current_branch"}

  local repo_http_url=$(get_repo_http_url)
  local repo_without_dot_git=$(dirname $repo_http_url)/$(basename $repo_http_url .git)
  local final_url="${repo_without_dot_git}/tree/${branch_name}"

  cat <<EOF
${final_url};
EOF
}
