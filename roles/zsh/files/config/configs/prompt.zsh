source /usr/lib/git-core/git-sh-prompt

setopt promptsubst

git_prompt() {
  local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3)"
  local branch_truncated="${branch:0:30}"
  if (( ${#branch} > ${#branch_truncated} )); then
    branch="${branch_truncated}..."
  fi

  [ -n "${branch}" ] && echo " (${branch})"
}
export PS1="in %{$fg[blue]%}%~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b "
