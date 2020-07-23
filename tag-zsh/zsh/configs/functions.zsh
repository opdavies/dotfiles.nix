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

# Run 'phpunit' or 'pest' depending on the project.
function p () {
  vendor/bin/$(phpunit-or-pest) $*;
}
function pf () {
  vendor/bin/$(phpunit-or-pest) --filter $*
}
