{
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:

{
  programs.neovim = {
    enable = true;

    package = pkgsUnstable.neovim-unwrapped;

    plugins = with pkgs.vimPlugins; [
      comment-nvim
      dial-nvim
      fidget-nvim
      gitsigns-nvim
      harpoon
      impatient-nvim
      mini-nvim
      neodev-nvim
      nvim-spectre
      nvim-web-devicons
      oil-nvim
      refactoring-nvim
      sort-nvim
      treesj
      undotree
      vim-abolish
      vim-eunuch
      vim-highlightedyank
      vim-just
      vim-nix
      vim-obsession
      vim-pasta
      vim-repeat
      vim-sleuth
      vim-sort-motion
      vim-terraform
      vim-textobj-user
      vim-unimpaired

      conf-vim
      edit-alternate-vim
      nvim-tmux-navigation
      standard-vim
      tabline-vim
      vim-autoread
      vim-textobj-indent
      vim-textobj-xmlattr
      vim-zoom

      # Testing
      vim-test

      # Git
      committia-vim
      diffview-nvim
      vim-fugitive

      # Debugging
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text

      # Treesitter
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (
        plugins: with plugins; [
          bash
          comment
          css
          csv
          dockerfile
          gitattributes
          gitignore
          go
          html
          javascript
          json
          kdl
          lua
          luadoc
          make
          markdown
          markdown_inline
          nix
          php
          phpdoc
          query
          rst
          scss
          sql
          terraform
          twig
          typescript
          vim
          vimdoc
          vue
          xml
          yaml
        ]
      ))
      nvim-treesitter-context
      nvim-treesitter-textobjects

      # LSP, linting and formatting
      conform-nvim
      lsp-status-nvim
      nvim-lint
      nvim-lspconfig

      # Completion
      cmp-buffer
      cmp-calc
      cmp-cmdline
      cmp-nvim-lsp
      cmp-path
      cmp-treesitter
      cmp_luasnip
      lspkind-nvim
      nvim-cmp

      # Snippets
      friendly-snippets
      luasnip

      # Telescope
      plenary-nvim
      popup-nvim
      telescope-frecency-nvim
      telescope-fzf-native-nvim
      telescope-live-grep-args-nvim
      telescope-nvim
      telescope-ui-select-nvim

      # Databases
      vim-dadbod
      vim-dadbod-ui
      vim-dadbod-completion

      # Themes
      catppuccin-nvim

      # Configuration.
      inputs.self.packages.${pkgs.system}.opdavies-nvim
    ];

    extraLuaConfig = ''
      if vim.loader then
        vim.loader.enable()
      end

      require "opdavies"
    '';

    extraPackages = with pkgs; [
      # Languages
      nodePackages.typescript
      nodejs-slim
      php81

      # Language servers
      gopls
      lua-language-server
      lua54Packages.luacheck
      marksman
      nixd
      nodePackages."@tailwindcss/language-server"
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.intelephense
      nodePackages.typescript-language-server
      nodePackages.vls
      nodePackages.vscode-langservers-extracted
      nodePackages.vue-language-server
      nodePackages.yaml-language-server
      phpactor
      terraform-ls

      # Formatters
      black
      eslint_d
      nixfmt-rfc-style
      nodePackages.prettier
      stylua
      yamlfmt

      # Tools
      hadolint
      html-tidy
      nodePackages.jsonlint
      nodePackages.markdownlint-cli
      php82Packages.php-codesniffer
      php82Packages.phpstan
      proselint
      shellcheck
      yamllint
    ];
  };

  home.file.".markdownlint.yaml".text = ''
    default: true

    line-length: false

    no-duplicate-heading:
      siblings_only: true
  '';
}
