setopt prompt_subst

git_branch() {
  local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"

  [ -n "${branch}" ] && echo " ${branch}"
}

git_commit() {
  local commit_sha="$(git rev-parse --short HEAD 2> /dev/null)"

  [ -n "${commit_sha}" ] && echo " [%{$fg[yellow]%}${commit_sha}%{$reset_color%}]"
}

export PS1='%{$fg[blue]%}%~%{$reset_color%}%{$fg[green]%}$(git_branch)%{$reset_color%}$(git_commit) $ '
