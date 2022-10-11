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
    plugins = with pkgs; [
      vimPlugins.comment-nvim
      vimPlugins.git-worktree-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
      vimPlugins.neogit
      vimPlugins.nvim-web-devicons
      vimPlugins.refactoring-nvim
      vimPlugins.rest-nvim
      vimPlugins.vim-abolish
      vimPlugins.vim-highlightedyank
      vimPlugins.vim-polyglot
      vimPlugins.vim-repeat
      vimPlugins.vim-surround
      vimPlugins.vim-test

      # Treesitter
      vimPlugins.nvim-treesitter
      vimPlugins.nvim-treesitter-context
      vimPlugins.nvim-treesitter-textobjects

      # LSP
      vimPlugins.null-ls-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.lsp-status-nvim

      # Completion
      vimPlugins.cmp-buffer
      vimPlugins.cmp-cmdline
      vimPlugins.cmp-nvim-lsp
      vimPlugins.cmp-path
      vimPlugins.cmp-treesitter
      vimPlugins.cmp-vsnip
      vimPlugins.cmp_luasnip
      vimPlugins.lspkind-nvim
      vimPlugins.nvim-cmp

      vimPlugins.luasnip

      # Telescope
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim
      vimPlugins.telescope-file-browser-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-nvim
      vimPlugins.telescope-ui-select-nvim

      # Git
      # vimPlugins.neogit

      # Databases
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion

      # Themes
      vimPlugins.nightfox-nvim
    ];
  };

  xdg.configFile.nvim = {
    source = ../../../config/neovim;
    recursive = true;
  };
}
