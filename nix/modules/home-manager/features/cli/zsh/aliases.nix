{
  "$" = "";
  "-" = "cd -";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  "....." = "cd ../../../..";
  cat = "bat";
  s = "secrets";
  secrets = ''doppler --project "$(whoami)" run'';
  tag = "tag-release";
  vss = "LC_ALL=C sort --unique $REPOS/dotfiles/nvim/spell/en.utf-8.add --output $REPOS/dotfiles/nvim/spell/en.utf-8.add";
  wt = "git worktree";
}
