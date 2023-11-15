{
  home.file.".gitmessage".text = ''
    type(scope): description

    # type: fix, feat, build, chore, ci, docs, style, refactor, perf, test
    #
    # Description
    #
    # - Why is this change necessary?
    # - How does it address the issue?
    # - What side effects does this change have?
    #
    # For breaking changes, add an ! after the type/scope, uncomment the following
    # line and describe the change:
    #
    # BREAKING CHANGE:
    #
    #
    # Add any issue IDs or commit SHAs that this commit references:
    #
    # Refs:

  '';

  xdg.configFile."git/ignore".text = ''
    /.direnv/
    /.ignored/
    /.issue-id
    /.phpactor.json
  '';

  programs.git = {
    enable = true;
    userName = "Oliver Davies";
    userEmail = "oliver@oliverdavies.uk";

    aliases = {
      aa = "add --all";
      assume = "update-index --assume-unchanged";
      assumed = "!git ls-files -v | grep '^[hsmrck?]' | cut -c 3-";
      b = "branch";
      browse = "!gh repo view --web";
      ca = "commit --amend --verbose";
      car = "commit --amend --no-edit";
      cl = "!hub clone";
      co = "checkout";
      compare = "!hub compare";
      current-branch = "rev-parse --abbrev-ref HEAD";
      dc = "diff --color --word-diff --cached";
      df = "diff --color --word-diff";
      dup =
        "!git checkout develop && git fetch origin && echo && git sl develop..origin/develop && echo && git pull --quiet && git checkout -";
      fixup = "commit --fixup";
      issues = "!gh issue list --web";
      mup =
        "!git master-to-main-wrapper checkout %BRANCH% && git fetch origin && echo && git sl %BRANCH%..origin/%BRANCH% && echo && git pull --quiet && git checkout -";
      no-ff = "merge --no-ff";
      pl = "pull";
      prune = "remote prune origin";
      ps = "push";
      pulls = "!gh pr list --web";
      rbc = "rebase --continue";
      rdup = "!git dup && git rebase develop";
      remotes = "remote -v";
      repush = "!git pull --rebase && git push";
      ri = "rebase --interactive";
      rid = "!git rebase -i $(git merge-base develop HEAD)";
      rim =
        "!git rebase -i $(git master-to-main-wrapper merge-base %BRANCH% HEAD)";
      rip = "!git rebase -i $(git merge-base production HEAD)";
      ris = "!git rebase -i $(git merge-base staging HEAD)";
      riu =
        "!git rebase -i $(git rev-parse --abbrev-ref --symbolic-full-name @{u})";
      rmup = "!git mup && git master-to-main-wrapper rebase %BRANCH%";
      sl = "log --oneline --decorate -20";
      sla = "log --oneline --decorate --graph --all -20";
      slap = "log --oneline --decorate --graph --all";
      slp = "log --oneline --decorate";
      staged = "diff --staged";
      unassume = "update-index --no-assume-unchanged";
      unstage = "reset";
      upstream = "rev-parse --abbrev-ref --symbolic-full-name @{u}";
      ureset = "!git reset --hard $(git upstream)";
      worktrees = "worktree list";
    };

    extraConfig = {
      branch = {
        autosetupmerge = true;
        autosetuprebase = "always";
      };
      checkout.defaultRemote = "origin";
      color.ui = true;
      commit = { template = "~/.gitmessage"; };
      core = {
        editor = "nvim";
        excludesFile = "~/.config/git/ignore";
        pager = "delta";
      };
      delta.line-numbers = true;
      diff.tool = "vimdiff";
      fetch.prune = true;
      grep.lineNumber = true;
      help.autocorrect = "1";
      init.defaultBranch = "main";
      merge.ff = "only";
      push = {
        autoSetupRemote = true;
        default = "upstream";
      };
      pull = {
        ff = "only";
        rebase = true;
      };
      rebase = {
        autosquash = true;
        autostash = true;
      };
    };
  };
}
