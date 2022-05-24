sources=(
  'aliases'
  'colour'
  'functions'
  'fzf'
  'general'
  'git'
  'history'
  'navigation'
  'nvm'
  'options'
  'path'
  'platformsh'
  'plugins'
  'prompt'
  'post/completion'
)
for s in "${sources[@]}"; do
  source $ZDOTDIR/configs/${s}.zsh
done

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
