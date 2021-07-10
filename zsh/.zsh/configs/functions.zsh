function m() {
 if [[ -f .notes/Makefile ]];
 then
  make -f .notes/Makefile "$@"
 else
  make "$@"
 fi
}

function mkd() {
   mkdir -p "$@" && cd "$@"
}

function composer() {
  docker run -u $UID -it --rm \
    -v $(pwd):/app \
    -v ~/.composer:/root/.composer \
    -v ~/.ssh:/root/.ssh \
    composer \
    composer $*
}

# Run 'phpunit' or 'pest' depending on the project.
function p () {
  vendor/bin/$(phpunit-or-pest) $*;
}
function pf () {
  vendor/bin/$(phpunit-or-pest) --filter $*
}
