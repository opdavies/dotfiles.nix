shorten() {
  pushd ~/Code/opdavi.es
  git pull --rebase
  npm run shorten $1 $2
  popd
}

function mkd() {
   mkdir -p "$@" && cd "$@"
}

function db {
  if [ "$1" = "refresh" ]; then
    mysql -uroot -e "drop database $2; create database $2"
  elif [ "$1" = "create" ]; then
    mysql -uroot -e "create database $2"
  elif [ "$1" = "drop" ]; then
    mysql -uroot -e "drop database $2"
  fi
}

is_linux() { [[ "$(uname)" == 'Linux'  ]] }
is_macos() { [[ "$(uname)" == "Darwin" ]] }
