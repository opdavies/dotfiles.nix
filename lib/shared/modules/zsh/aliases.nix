{
  "-" = "cd -";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  "....." = "cd ../../../..";
  cat = "bat";
  s = "secrets";
  secrets = ''doppler --project "$(whoami)" run'';
  tag = "tag-release";
  wt = "git worktree";
  vss = "LC_ALL=C sort --unique $REPOS/opdavies.nvim/spell/en.utf-8.add --output $REPOS/opdavies.nvim/spell/en.utf-8.add";
}
