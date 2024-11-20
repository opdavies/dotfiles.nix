abbr c="clear"
abbr cs="create-script"
abbr daily="run create-daily next"
abbr rst="rst2pdf"
abbr st="source .tmux"
abbr sz="source ~/.config/zsh/.zshrc"
abbr ti="timer"
abbr uagr="update-all-git-repos"
abbr v="nvim"
abbr yt="yt-dlp"

abbr evl="export-video-list"
abbr vv="cat ~/Documents/videos.json"

abbr g="git"
abbr ga="git add"
abbr gan="git add -N"
abbr gap="git add -p"
abbr gb="git branch"
abbr gbl="git blame"
abbr gc="git commit"
abbr gca="git commit --amend"
abbr gcan="git commit --amend --no-edit"
abbr gcl="git clone"
abbr gcm="git commit -m"
abbr gco="git checkout"
abbr gcob="git checkout -b"
abbr gd="git diff"
abbr gds="git diff --staged"
abbr gf="git fetch"
abbr gfa="git fetch --all"
abbr gl="git log"
abbr glo="git log --oneline"
abbr gls="git log --stat"
abbr gm="git merge"
abbr gmf="git merge --ff"
abbr gmnf="git merge --no-ff"
abbr gpl="git pull"
abbr gplr="git pull --rebase"
abbr gps="git push"
abbr gpsa="git push acquia"
abbr gpsam="git push acquia main"
abbr gpsap="git push acquia HEAD:production"
abbr gpso="git push origin"
abbr gpsom="git push origin main"
abbr gr="git rebase"
abbr gra="git rebase --abort"
abbr grc="git rebase --continue"
abbr gri="git rebase -i"
abbr gs="git status"
abbr gsh="git show"
abbr gst="git stash"
abbr gstp="git stash pop"

# tmux
abbr ta="tmux attach"
abbr tl="tmux list-sessions"
abbr tk="tmux kill-session"

# zellij
abbr czs="create-zellij-session"
abbr z="zellij"
abbr za="zellij attach"
abbr zd="zellij delete-session"
abbr zda="zellij delete-all-sessions"
abbr ze="zellij edit"
abbr zei="zellij edit --in-place"
abbr zk="zellij kill-session"
abbr zka="zellij kill-all-sessions | sort"
abbr zl="zellij list-sessions | grep -v EXITED"
abbr zla="zellij list-sessions"
abbr znt="zellij action new-tab"
abbr zr="zellij run --"
abbr zri="zellij run --in-place --"
abbr zrf="zellij run --floating --"
abbr multitask="zellij action start-or-reload-plugin file:$HOME/zellij-plugins/multitask.wasm --configuration "shell=$SHELL,cwd=`pwd`""

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
abbr rcda="run composer dump-autoload"
abbr rci="run composer install"
abbr rcr="run composer require"
abbr rcu="run composer update"
abbr rd="run drush"
abbr rdce="run drush config:export -y"
abbr rdci="run drush config:import -y"
abbr rdcr="run drush cache:rebuild"
abbr rdscr="run drush php:script"
abbr rduli="run drush uli"
abbr rdup="run drush updatedb -y"
abbr rpub="run publish"
abbr rt="run test"

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

abbr today="task +TODAY"
abbr tomorrow="task +TOMORROW"
abbr overdue="task +OVERDUE"

abbr nah="git reset --hard; git clean -fd"
abbr wip="git commit -m wip"

abbr dv="devenv"
abbr dvi="devenv info"
abbr dvp="devenv processes"
abbr dvs="devenv shell"
abbr dvt="devenv tasks"
abbr dvu="devenv up"
