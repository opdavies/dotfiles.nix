{ inputs }:
{ pkgs, ... }:
let system = pkgs.system;
in {
  programs.neovim = inputs.opdavies-nvim.lib.mkHomeManager { inherit system; };

  home.file.".markdownlint.yaml".text = ''
    default: true

    line-length: false

    no-duplicate-heading:
      siblings_only: true
  '';
}
