autoload -Uz colors && colors

prompt_color() {
  [[ -n "$1" ]] && print "%{$fg_bold[$2]%}$1%{$reset_color%}"
}

prompt_blue() { print "$(prompt_color "$1" blue)" }
prompt_green() { print "$(prompt_color "$1" green)" }
prompt_red() { print "$(prompt_color "$1" red)" }
prompt_yellow() { print "$(prompt_color "$1" yellow)" }

prompt_full_path() {
  print "$(prompt_blue %~)"
}

prompt_shortened_path() {
  print "$(prompt_blue %2~)"
}

prompt_git_branch() {
  local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"

  [ -n "${branch}" ] && print "$(prompt_green $branch)"
}

prompt_git_commit() {
  local commit_sha="$(git rev-parse --short HEAD 2> /dev/null)"

  [ -n "${commit_sha}" ] && echo [$(prompt_yellow $commit_sha)]
}

setopt prompt_subst

PROMPT='$(prompt_shortened_path) $(prompt_git_branch) $(prompt_git_commit) $ '
