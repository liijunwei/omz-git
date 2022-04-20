function git-get-first-commit-of() {
  local user_keyword=$1
  local commit_id=$(git log --author="$user_keyword" --pretty=format:"%H" --all | tail -n1)

  git show $commit_id
}
