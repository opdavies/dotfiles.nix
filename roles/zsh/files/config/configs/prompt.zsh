source $ZDOTDIR/oh-my-zsh/git.zsh

git_prompt_prefix() {
  local tag="$(git describe --tags 2> /dev/null)"

  [ -n "${tag}" ] && echo "%{$fg[yellow]%}${tag}%{$reset_color%} "
}

git_prompt_suffix() {
  local branch="$(git_current_branch)"

  [ -n "${branch}" ] && echo " on %{$fg[green]%}${branch}%{$reset_color%}"
}

export PS1="$(git_prompt_prefix)in %{$fg[blue]%}%1d/%{$reset_color%}$(git_prompt_suffix) "
