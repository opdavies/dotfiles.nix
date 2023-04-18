{ config, lib, pkgs, ... }:
let
in {
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "intelephense"
    "postman"
  ];

  home.packages = (import ./packages.nix) { inherit pkgs; };

  programs.bat.enable = true;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs; [
      customVim.tabline-vim
      customVim.vim-astro
      customVim.vim-caser
      customVim.vim-heritage
      customVim.vim-just
      customVim.vim-textobj-xmlattr
      customVim.vim-visual-star-search

      vimPlugins.comment-nvim
      vimPlugins.dial-nvim
      vimPlugins.git-worktree-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
      vimPlugins.indent-blankline-nvim
      vimPlugins.nvim-autopairs
      vimPlugins.nvim-lastplace
      vimPlugins.nvim-ts-autotag
      vimPlugins.nvim-web-devicons
      vimPlugins.refactoring-nvim
      vimPlugins.rest-nvim
      vimPlugins.splitjoin-vim
      vimPlugins.vim-abolish
      vimPlugins.vim-eunuch
      vimPlugins.vim-floaterm
      vimPlugins.vim-highlightedyank
      vimPlugins.vim-nix
      vimPlugins.vim-pasta
      vimPlugins.vim-polyglot
      vimPlugins.vim-repeat
      vimPlugins.vim-sleuth
      vimPlugins.vim-surround
      vimPlugins.vim-terraform
      vimPlugins.vim-test
      vimPlugins.vim-textobj-user
      vimPlugins.vim-tmux-navigator
      vimPlugins.vim-unimpaired
      vimPlugins.vimux

      # Git
      vimPlugins.vim-fugitive
      vimPlugins.vim-rhubarb
      vimPlugins.neogit

      # Debugging
      vimPlugins.nvim-dap
      vimPlugins.nvim-dap-ui
      vimPlugins.nvim-dap-virtual-text

      # Treesitter
      vimPlugins.nvim-treesitter.withAllGrammars
      vimPlugins.nvim-treesitter-context
      vimPlugins.nvim-treesitter-textobjects

      # LSP
      vimPlugins.null-ls-nvim
      vimPlugins.nvim-lspconfig
      vimPlugins.lsp-status-nvim
      vimPlugins.lsp-zero-nvim

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
      vimPlugins.telescope-frecency-nvim
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.telescope-live-grep-args-nvim
      vimPlugins.telescope-nvim
      vimPlugins.telescope-ui-select-nvim

      # Databases
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion

      # Themes
      vimPlugins.catppuccin-nvim
    ];

    extraPackages = with pkgs; [
      ansible-language-server
      black
      gopls
      html-tidy
      lua53Packages.lua-lsp
      nodePackages."@astrojs/language-server"
      nodePackages."@tailwindcss/language-server"
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.eslint
      nodePackages.intelephense
      nodePackages.markdownlint-cli
      nodePackages.prettier
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vue-language-server
      nodePackages.vls
      nodePackages.vscode-langservers-extracted
      nodePackages.yaml-language-server
      php81Packages.phpcbf
      php81Packages.phpcs
      php81Packages.phpstan
      proselint
      rnix-lsp
      shellcheck
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
