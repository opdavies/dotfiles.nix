abbr dea="direnv allow"
abbr dee="direnv edit"
abbr cs="create-script"
abbr daily="run create-daily next"
abbr switch="run nixos nixedo switch"
abbr sz="source ~/.config/zsh/.zshrc"

abbr g="git"
abbr ga="git add"
abbr gap="git add -p"
abbr gc="git commit"
abbr gpl="git pull"
abbr gps="git push"
abbr gri="git rebase -i"
abbr gs="git status"

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

# run scripts.
abbr r="run"
abbr rc="run composer"
abbr rd="run drush"
abbr rdcr="run drush cr"
abbr rdup="run drush updb -y"
abbr rdce="run drush config:export -y"
abbr rdci="run drush config:import -y"
abbr rduli="run drush uli"

abbr -g A1="| awk '{print $1}'"
abbr -g Fj="| jq ."
abbr -g Fy="| yq ."
abbr -g G="| grep"
abbr -g GH="| grep HTTP"
abbr -g Gi="| grep -i"
abbr -g H2="| head -n 20"
abbr -g H="| head"
abbr -g L="| less"
abbr -g V="| vim -"
abbr -g X="| xargs -I1"
