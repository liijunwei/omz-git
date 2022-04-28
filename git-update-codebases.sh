MASTER_OR_MAIN_BRANCHE=(
  main
  master
)

# TODO use https://www.gnu.org/software/parallel/
function update-all-codebases() {
  local current_dir=$(pwd)

  for project in $(ls -d */); do
    cd $project

    local result=$(git rev-parse --is-inside-work-tree &> /dev/null; echo $?)

    if [ "$result" = "0" ]; then
      echo "\e[1;31m[Updating $project]\e[0m"
      echo "========================================="
      git up
    else
      echo "\e[1;31m[Not a git repository: $(pwd)]\e[0m"
    fi

    cd ..
  done

  cd $current_dir
}
