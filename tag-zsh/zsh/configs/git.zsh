# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# > 0 ]];
  then
    git $@
  else
    git status --short --branch
  fi
}
