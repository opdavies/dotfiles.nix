alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend --no-edit --reset-author"
alias gcm="git commit -m"
alias gl="git log"
alias gs="git status"

alias gh="github"
alias nah="git reset --hard && git clean -fd"
alias wip="git add . && git commit -m 'wip'"

alias l="ls -lah"

# Fast open
alias o="open ."

alias p="phpunit"
alias pf="phpunit --filter "
alias pstorm="phpstorm"
alias st="subl"
alias stt="subl ."

# Quickly go to the Code directory
alias web="cd ~/Code"

alias y=yarn
alias ya='yarn add'
alias yd="yarn dev"
alias yp="yarn prod"
alias ys="yarn serve"
alias yw="yarn watch"

# Shorter Git commands.
alias add='git add'
alias amend='git commit --amend'
alias clone='git clone'
alias commit='git commit'
alias pull='git pull'
alias push='git push'
alias rebase='git rebase'
alias reset='git reset'

alias hosts="sudo vim /etc/hosts"
alias sshconfig='vim ~/.ssh/config'
alias zshconfig='vim ~/.zshrc'
# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# PhpStorm
alias pstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# Sublime Text
alias sublime='open -a /Applications/Sublime\ Text.app "`pwd`"'
# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local
