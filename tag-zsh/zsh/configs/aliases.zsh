alias l="ls -lah"

# Fast open
alias o="open ."

alias p="phpunit"
alias pf="phpunit --filter "
alias pstorm="phpstorm"
alias st="subl"
alias stt="subl ."

alias y=yarn
alias ya='yarn add'
alias yd="yarn dev"
alias yp="yarn prod"
alias ys="yarn serve"
alias yw="yarn watch"

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
