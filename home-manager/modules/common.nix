{ config, lib, pkgs, ... }:
let
in {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "intelephense"
    "postman"
  ];

  home.packages = with pkgs; [
    bottom
    ctop
    delta
    doppler
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
      customVim.vim-astro = pkgs.vimUtils.buildVimPlugin {
        name = "vim-astro";
        src = pkgs.fetchFromGitHub {
          owner = "wuelnerdotexe";
          repo = "vim-astro";
          rev = "main";
          sha256 = "HyQ4i/T1uQmGurBqCpo8+ESVSVPsTrLQBxLe2OEYjcY=";
        };
      };

      customVim.tabline-vim = pkgs.vimUtils.buildVimPlugin {
        name = "tabline-vim";
        src = pkgs.fetchFromGitHub {
          owner = "mkitt";
          repo = "tabline.vim";
          rev = "69c9698a3240860adaba93615f44778a9ab724b4";
          sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
        };
      };
    in with pkgs; [
      vimPlugins.comment-nvim
      vimPlugins.dial-nvim
      vimPlugins.git-worktree-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
      vimPlugins.indent-blankline-nvim
      vimPlugins.neogit
      vimPlugins.nvim-web-devicons
      vimPlugins.refactoring-nvim
      vimPlugins.rest-nvim
      vimPlugins.splitjoin-vim
      vimPlugins.vim-abolish
      vimPlugins.vim-floaterm
      vimPlugins.vim-highlightedyank
      vimPlugins.vim-polyglot
      vimPlugins.vim-repeat
      vimPlugins.vim-surround
      vimPlugins.vim-test
      vimPlugins.vim-tmux-navigator
      vimPlugins.vimux
      customVim.vim-astro
      customVim.tabline-vim

      # Debugging
      vimPlugins.nvim-dap
      vimPlugins.nvim-dap-ui
      vimPlugins.nvim-dap-virtual-text

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
      vimPlugins.cmp-nvim-lsp-signature-help
      vimPlugins.cmp-path
      vimPlugins.cmp-tabnine
      vimPlugins.cmp-treesitter
      vimPlugins.cmp-vsnip
      vimPlugins.cmp_luasnip
      vimPlugins.lspkind-nvim
      vimPlugins.nvim-cmp

      # Snippets
      vimPlugins.luasnip

      # Telescope
      vimPlugins.plenary-nvim
      vimPlugins.popup-nvim
      vimPlugins.telescope-file-browser-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-nvim
      vimPlugins.telescope-ui-select-nvim

      # Databases
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion

      # Themes
      vimPlugins.onedark-nvim
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
