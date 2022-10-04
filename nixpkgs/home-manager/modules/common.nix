{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "intelephense"
  ];

  home.packages = with pkgs; [
    bottom
    ctop
    delta
    file
    fzf
    gcc
    gh
    git
    git-crypt
    just
    tree-sitter
    htop
    jq
    lua
    neofetch
    platformsh
    pv
    ripgrep
    tldr
    tmuxinator
    tree
    unzip
    wget

    # LSP
    # TODO: nodePackages."@ansible/ansible-language-server"
    html-tidy
    nodePackages."@tailwindcss/language-server"
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.eslint
    nodePackages.intelephense
    nodePackages.markdownlint-cli
    nodePackages.prettier
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vls
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    php81Packages.phpcbf
    php81Packages.phpcs
    php81Packages.phpstan
    rnix-lsp
    shellcheck
  ];

  programs.bat.enable = true;

  programs.neovim = {
    enable = true;

    extraConfig = ''
    lua << EOF
    vim.opt.number = true
    vim.opt.relativenumber = true
    EOF
    '';

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
    ];
  };
}
