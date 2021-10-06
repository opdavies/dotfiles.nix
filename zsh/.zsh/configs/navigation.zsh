bindkey -s "^f" "tmux-sessioniser\n"

# Search through history with the up and down arrows.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up
bindkey "${terminfo[kcud1]}" up-line-or-beginning-search # Down
