{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    just

    # LSP
    nodePackages.markdownlint-cli
  ];

  programs.bat.enable = true;

  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs; [
      vimPlugins.comment-nvim
      vimPlugins.git-worktree-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
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
      vimPlugins.neogit

      # Databases
      vimPlugins.vim-dadbod
      vimPlugins.vim-dadbod-ui
      vimPlugins.vim-dadbod-completion

      # Themes
      vimPlugins.nightfox-nvim
    ];
  };
}
