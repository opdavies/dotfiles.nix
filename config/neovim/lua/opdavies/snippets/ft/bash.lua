local ls = require "luasnip"

local fmta = require("luasnip.extras.fmt").fmta

return {
  run = fmta(
    [=[
    #!/usr/bin/env bash

    set -o errexit
    set -o nounset
    set -o pipefail

    function help {
      printf "%s <<task>> [args]\n\nTasks:\n" "${0}"

      compgen -A function | grep -v "^_" | cat -n

      printf "\nExtended help:\n  Each task has comments for general usage\n"
    }

    # Include any local tasks.
    # https://stackoverflow.com/a/6659698
    [[ -e "${BASH_SOURCE%/*}/run.local" ]] && source "${BASH_SOURCE%/*}/run.local"

    TIMEFORMAT="Task completed in %3lR"
    time "${@:-help}"
    ]=],
    {}
  ),
}
