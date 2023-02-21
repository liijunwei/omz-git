#!/bin/bash

function repo_http_url() {
  local url=$(
    git remote get-url --push origin |
      cut -d '@' -f 2 |
      sed 's/:9876//' |
      sed 's/^https:\/\///' |
      sed 's/com:/com\//' |
      sed 's/\.git//'
  )

  echo "https://${url}"
}

function or() {
  cat <<EOF

USAGE: Open Repo in Github/Gitlab
-------------------------------------------------------------
cd $HOME/OuterGitRepo/whenever
or   # Open url from browser, and show info.
or x # Do not open url, just show info.
-------------------------------------------------------------
$(repo_http_url)

EOF

  [[ -z "$1" ]] && open $(repo_http_url)
}
