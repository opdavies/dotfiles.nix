{
  inputs,
  pkgs,
  pkgsUnstable,
  ...
}:

let
  inherit (pkgs) fetchFromGitHub;
  inherit (pkgs.vimUtils) buildVimPlugin;

  # TODO: move these back into an overlay.
  customVim = {
    conf-vim = buildVimPlugin {
      name = "conf-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "conf.vim";
        rev = "master";
        sha256 = "AjiTJsoim0BAnyfqk1IQzNsa6jhFM2+A66E7q9sJqz0=";
      };
    };

    edit-alternate-vim = buildVimPlugin {
      name = "edit-alternate-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "edit_alternate.vim";
        rev = "master";
        sha256 = "mEKnqYAhgrdxPRoKf4S4yYecdFIHGg8bDxpqPuC1+S4=";
      };
    };

    standard-vim = buildVimPlugin {
      name = "standard-vim";
      src = fetchFromGitHub {
        owner = "tjdevries";
        repo = "standard.vim";
        rev = "master";
        sha256 = "9VwkvV1Dv6cE4uDkPp36DozjWJOclDR883yDMYw000E=";
      };
    };

    vim-autoread = buildVimPlugin {
      name = "vim-autoread";
      src = fetchFromGitHub {
        owner = "djoshea";
        repo = "vim-autoread";
        rev = "24061f84652d768bfb85d222c88580b3af138dab";
        sha256 = "fSADjNt1V9jgAPjxggbh7Nogcxyisi18KaVve8j+c3w=";
      };
    };

    vim-textobj-indent = buildVimPlugin {
      name = "vim-textobj-indent";
      src = fetchFromGitHub {
        owner = "kana";
        repo = "vim-textobj-indent";
        rev = "deb76867c302f933c8f21753806cbf2d8461b548";
        sha256 = "oFzUPG+IOkbKZ2gU/kduQ3G/LsLDlEjFhRP0BHBE+1Q=";
      };
    };

    toggle-checkbox-nvim = buildVimPlugin {
      name = "toggle-checkbox-nvim";
      src = fetchFromGitHub {
        owner = "opdavies";
        repo = "toggle-checkbox.nvim";
        rev = "main";
        sha256 = "4YSEagQnLK5MBl2z53e6sOBlCDm220GYVlc6A+HNywg=";
      };
    };

    vim-heritage = buildVimPlugin {
      name = "vim-heritage";
      src = fetchFromGitHub {
        owner = "jessarcher";
        repo = "vim-heritage";
        rev = "cffa05c78c0991c998adc4504d761b3068547db6";
        sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
      };
    };

    vim-textobj-xmlattr = buildVimPlugin {
      name = "vim-textobj-xmlattr";
      src = fetchFromGitHub {
        owner = "whatyouhide";
        repo = "vim-textobj-xmlattr";
        rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
        sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
      };
    };

    tabline-vim = buildVimPlugin {
      name = "tabline-vim";
      src = fetchFromGitHub {
        owner = "mkitt";
        repo = "tabline.vim";
        rev = "69c9698a3240860adaba93615f44778a9ab724b4";
        sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
      };
    };

    vim-caser = buildVimPlugin {
      name = "vim-caser";
      src = fetchFromGitHub {
        owner = "arthurxavierx";
        repo = "vim-caser";
        rev = "6bc9f41d170711c58e0157d882a5fe8c30f34bf6";
        sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
      };
    };

    vim-zoom = buildVimPlugin {
      name = "vim-zoom";
      src = fetchFromGitHub {
        owner = "dhruvasagar";
        repo = "vim-zoom";
        rev = "01c737005312c09e0449d6518decf8cedfee32c7";
        sha256 = "/ADzScsG0u6RJbEtfO23Gup2NYdhPkExqqOPVcQa7aQ=";
      };
    };
  };
in
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

      customVim.conf-vim
      customVim.edit-alternate-vim
      customVim.standard-vim
      customVim.tabline-vim
      customVim.vim-autoread
      customVim.vim-textobj-indent
      customVim.vim-textobj-xmlattr
      customVim.vim-zoom

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
      nodePackages.volar
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
