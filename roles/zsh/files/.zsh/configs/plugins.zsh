# antigen.zsh has been downloaded manually for now,
# see https://github.com/zsh-users/antigen/issues/659.
source $HOME/.antigen.zsh

antigen bundle mollifier/cd-gitroot
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

eval "$(starship init zsh)"
