# inspired by gitlab source@scripts/lint-conflicts.sh

function git-check-conflicts() {
  local output=$(git grep -En '^<<<<<<< ')
  echo ${output:-"No Confliecs Found"}
}
