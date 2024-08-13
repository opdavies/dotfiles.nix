{
  programs.pet = {
    enable = true;

    snippets = [
      {
        command = "nix flake lock --update-input <input-name>";
        description = "Display a log of a Git repository, showing each commit on its own line.";
        output = "";
        tag = [ "git" ];
      }

      {
        command = "nix flake lock --update-input opdavies-nvim";
        description = "Update a single input within a Nix flake.";
        output = "";
        tag = [
          "nix"
          "nix-flake"
        ];
      }
    ];
  };
}
