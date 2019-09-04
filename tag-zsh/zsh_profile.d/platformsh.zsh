# Platform.sh CLI configuration.
export PATH="$HOME/"'.platformsh/bin':"$PATH"

if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then
  . "$HOME/"'.platformsh/shell-config.rc';
fi
