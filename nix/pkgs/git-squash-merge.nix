{ pkgs }:

pkgs.writeShellApplication {
  name = "git-squash-merge";

  runtimeInputs = with pkgs; [
    bashInteractive
    coreutils
    git
  ];

  text = ''
    branch_to_merge=$1
    target_branch=''${2:-main}

    if [[ -z "$branch_to_merge" ]]; then
      echo "Usage: $0 <branch-to-merge> [target-branch]"
      exit 1
    fi

    if ! git checkout "$target_branch"; then
      echo "Error: Failed to checkout target branch '$target_branch'."
      exit 1
    fi

    if ! git merge --squash "$branch_to_merge"; then
      echo "Error: Squash merge from '$branch_to_merge' to '$target_branch' failed."
      exit 1
    fi

    squashed_commit_messages=$(git log "$target_branch..$branch_to_merge" --reverse --pretty=format:"%h %s%n%b%n")

    temp_file=$(mktemp)
    echo -e "$squashed_commit_messages" > "$temp_file"

    GIT_COMMIT_EDITMSG="$temp_file" git commit --edit

    rm -f "$temp_file"
  '';
}
