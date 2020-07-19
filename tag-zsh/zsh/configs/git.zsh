# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $1 == init ]];
  then
    # Prefer "main" to "master"
    git "$@"
    git checkout -b main
    git branch -d master
  elif [[ $# > 0 ]];
  then
    git $@
  else
    git status --short --branch
  fi
}
