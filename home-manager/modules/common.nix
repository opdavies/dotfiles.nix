{ config, lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "intelephense"
    "postman"
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
    mysql
    neofetch
    nodejs
    php81
    platformsh
    postman
    pulumi-bin
    pv
    ripgrep
    terraform
    tldr
    tmuxinator
    tree
    unzip
    wget
    yarn
    zoxide

    # LSP
    gopls
    html-tidy
    nodePackages."@ansible/ansible-language-server"
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
    sumneko-lua-language-server
  ];

  programs.bat.enable = true;

  programs.neovim = {
    enable = true;
    plugins = let
      phpactor = pkgs.vimUtils.buildVimPlugin {
        name = "phpactor";
        src = pkgs.fetchFromGitHub {
          owner = "phpactor";
          repo = "phpactor";
          rev = "master";
          sha256 = "0bgfwidrlaqxnjmk14gqc8b0mxh0c5xf098qcjz9mvw236n88xl7";
        };
      };

      vim-astro = pkgs.vimUtils.buildVimPlugin {
        name = "vim-astro";
        src = pkgs.fetchFromGitHub {
          owner = "wuelnerdotexe";
          repo = "vim-astro";
          rev = "main";
          sha256 = "HyQ4i/T1uQmGurBqCpo8+ESVSVPsTrLQBxLe2OEYjcY=";
        };
      };
    in
    with pkgs.vimPlugins; [
      vim-astro

      comment-nvim
      git-worktree-nvim
      gitsigns-nvim
      harpoon
      impatient-nvim
      indent-blankline-nvim
      neogit
      nvim-web-devicons
      refactoring-nvim
      rest-nvim
      splitjoin-vim
      vim-abolish
      vim-highlightedyank
      vim-polyglot
      vim-repeat
      vim-surround
      vim-test
      vim-tmux-navigator
      vimux

      # Debugging
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text

      # Treesitter
      nvim-treesitter
      nvim-treesitter-context
      nvim-treesitter-textobjects

      # LSP
      null-ls-nvim
      nvim-lspconfig
      lsp-status-nvim

      # Completion
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-path
      cmp-tabnine
      cmp-treesitter
      cmp-vsnip
      cmp_luasnip
      lspkind-nvim
      nvim-cmp

      # Snippets
      luasnip

      # Telescope
      plenary-nvim
      popup-nvim
      telescope-file-browser-nvim
      telescope-fzf-native-nvim
      telescope-nvim
      telescope-ui-select-nvim

      # Git
      # neogit

      # Databases
      vim-dadbod
      vim-dadbod-ui
      vim-dadbod-completion

      # Themes
      catppuccin-nvim
      nightfox-nvim
      onehalf
    ];
  };

  home.sessionPath = [
    "$HOME/.config/bin"
  ];

  xdg.configFile.bin = {
    source = ../../bin;
    recursive = true;
  };

  xdg.configFile.nvim = {
    source = ../../config/neovim;
    recursive = true;
  };
}
