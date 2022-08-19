alias hosts='sudo vim /etc/hosts'
alias rebase='git fetch --all --prune --prune-tags && git rebase'
alias sshconfig='vim ~/.ssh/config'
alias vim='nvim'

# Allow for pasting lines of code that start with a dollar sign.
alias \$=''

# Re-implement pbcopy and pbpaste from macOS.
alias pbcopy="xclip -selection clipboard"
alias pbpaste="xclip -selection clipboard -o"
