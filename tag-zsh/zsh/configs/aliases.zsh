alias c="clear"
alias l="ls -lah"
alias m=make
alias mkdir="mkdir -p"
alias p=phpunit
alias pf=phpunit --filter
alias s=symfony
alias v=vagrant

# Open the current directory in Finder.
alias o="open ."

alias hosts="sudo vim /etc/hosts"
alias sshconfig='vim ~/.ssh/config'

# Pretty print the path.
alias path='echo $PATH | tr -s ":" "\n"'

# Open the current directory in PhpStorm.
alias pstorm='open -a /Applications/PhpStorm.app "`pwd`"'

# Open the current directory in Sublime Text.
alias sublime='open -a /Applications/Sublime\ Text.app "`pwd`"'

# Allow for pasting lines of code that start with a dollar sign.
alias \$=''

# Include custom aliases
if [[ -f ~/.aliases.local ]]; then
  source ~/.aliases.local
fi
