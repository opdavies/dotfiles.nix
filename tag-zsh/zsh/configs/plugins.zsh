if is_macos; then
  source /usr/local/share/antigen/antigen.zsh
elif is_linux; then
  source /usr/share/zsh-antigen/antigen.zsh
fi

antigen bundle mollifier/cd-gitroot
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply
