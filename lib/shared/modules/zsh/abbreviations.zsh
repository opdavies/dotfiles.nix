abbr c="clear"
abbr cs="create-script"
abbr daily="run create-daily next"
abbr rst="rst2pdf"
abbr sz="source ~/.config/zsh/.zshrc"
abbr ti="timer"
abbr v="nvim"

abbr evl="export-video-list"
abbr vv="cat ~/Documents/videos.json"

abbr g="git"
abbr ga="git add"
abbr gb="git blame"
abbr gan="git add -N"
abbr gap="git add -p"
abbr gc="git commit"
abbr gca="git commit --amend"
abbr gcm="git commit -m"
abbr gd="git diff"
abbr gf="git fetch"
abbr gfa="git fetch --all"
abbr gl="git log"
abbr glo="git log --oneline"
abbr gls="git log --stat"
abbr gpl="git pull"
abbr gps="git push"
abbr gri="git rebase -i"
abbr gs="git status"
abbr gsh="git show"
abbr gst="git status"

# tmux
abbr ta="tmux attach"
abbr tl="tmux list-sessions"
abbr tk="tmux kill-session"

# Docker and Docker Compose.
abbr dk="docker"
abbr dkp="docker ps"
abbr dkpa="docker ps -a"
abbr dkpaq="docker ps -a -q"
abbr dkb="docker build -t"
abbr dks="docker start"
abbr dkt="docker stop"
abbr dkrm="docker rm"
abbr dkri="docker rmi"
abbr dke="docker exec -ti"
abbr dkl="docker logs -f"
abbr dki="docker images"
abbr dkpu="docker pull"
abbr dkph="docker push"
abbr dkbnc="docker build --no-cache -t"
abbr dkr="docker run --rm"
abbr dkrti="docker run --rm -ti"
abbr dkc="docker compose"
abbr dkcb="docker compose build"
abbr dkcu="docker compose up"
abbr dkclean="docker ps -q -a -f status=exited | xargs -r docker rm && docker images -q -f dangling=true | xargs -r docker rmi"

# Nix and direnv.
abbr dea="direnv allow"
abbr dee="direnv edit"
abbr nxf="nix flake"
abbr nxfc="nix flake check"
abbr nxfs="nix flake show"
abbr nxfu="nix flake update"
abbr nxr="nix run nixpkgs#%"
abbr nxs="nix shell nixpkgs#%"

# run scripts.
abbr r="run"
abbr rc="run composer"
abbr rd="run drush"
abbr rdce="run drush config:export -y"
abbr rdci="run drush config:import -y"
abbr rdcr="run drush cache:rebuild"
abbr rdscr="run drush php:script"
abbr rduli="run drush uli"
abbr rdup="run drush updatedb -y"

abbr clh="curl localhost:%"
abbr clh3="curl localhost:3000%"
abbr clh8="curl localhost:8000%"

abbr -g A1="| awk '{print $1}'"
abbr -g C="| xclip -sel clip"
abbr -g Fj="| jq ."
abbr -g Fy="| yq ."
abbr -g G="| grep"
abbr -g GH="| grep HTTP"
abbr -g Gi="| grep -i"
abbr -g H2="| head -n 20"
abbr -g H="| head"
abbr -g L="| less"
abbr -g V="| nvim -"
abbr -g X="| xargs -I1"
