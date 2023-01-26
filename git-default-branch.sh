function origin_default_branch() {
  git rev-parse --abbrev-ref origin/HEAD
}

function default_branch() {
  basename $(origin_default_branch)
}

function rdd() {
  git rebase $(default_branch)
}

function de() {
  git checkout $(default_branch)
}

# initially designed for develop/default branch file
function de-file() {
  local filepath=$1
  local final_url="$(repo_http_url)/blob/$(default_branch)/${filepath}"

  echo $final_url
  open $final_url
}
