{ inputs, pkgs, self, ... }:

let
  pkgsUnstable = inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}";

  customVim = with self; {
    toggle-checkbox-nvim = pkgs.vimUtils.buildVimPlugin {
      name = "toggle-checkbox-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "opdavies";
        repo = "toggle-checkbox.nvim";
        rev = "main";
        sha256 = "1h9IGyMa80HWrtiPjruG4cYBqgTafNirW0Hwl/JO70A=";
      };
    };

    vim-heritage = pkgs.vimUtils.buildVimPlugin {
      name = "vim-heritage";
      src = pkgs.fetchFromGitHub {
        owner = "jessarcher";
        repo = "vim-heritage";
        rev = "cffa05c78c0991c998adc4504d761b3068547db6";
        sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
      };
    };

    vim-textobj-xmlattr = pkgs.vimUtils.buildVimPlugin {
      name = "vim-textobj-xmlattr";
      src = pkgs.fetchFromGitHub {
        owner = "whatyouhide";
        repo = "vim-textobj-xmlattr";
        rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
        sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
      };
    };

    tabline-vim = pkgs.vimUtils.buildVimPlugin {
      name = "tabline-vim";
      src = pkgs.fetchFromGitHub {
        owner = "mkitt";
        repo = "tabline.vim";
        rev = "69c9698a3240860adaba93615f44778a9ab724b4";
        sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
      };
    };

    vim-caser = pkgs.vimUtils.buildVimPlugin {
      name = "vim-caser";
      src = pkgs.fetchFromGitHub {
        owner = "arthurxavierx";
        repo = "vim-caser";
        rev = "6bc9f41d170711c58e0157d882a5fe8c30f34bf6";
        sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
      };
    };

    vim-zoom = pkgs.vimUtils.buildVimPlugin {
      name = "vim-zoom";
      src = pkgs.fetchFromGitHub {
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

    plugins = with pkgs; [
      customVim.tabline-vim
      customVim.vim-caser
      customVim.vim-heritage
      customVim.vim-textobj-xmlattr
      customVim.vim-zoom
      pkgsUnstable.vimPlugins.vim-astro
      vimPlugins.vim-visual-star-search

      {
        plugin = customVim.toggle-checkbox-nvim;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<leader>t", ":lua require('toggle-checkbox').toggle()<CR>")
        '';
      }

      pkgsUnstable.vimPlugins.refactoring-nvim
      vimPlugins.comment-nvim
      vimPlugins.dial-nvim
      vimPlugins.gitsigns-nvim
      vimPlugins.harpoon
      vimPlugins.impatient-nvim
      vimPlugins.nvim-web-devicons
      vimPlugins.rest-nvim
      vimPlugins.undotree
      vimPlugins.vim-easy-align
      vimPlugins.vim-eunuch
      vimPlugins.vim-highlightedyank
      vimPlugins.vim-nix
      vimPlugins.vim-obsession
      vimPlugins.vim-pasta
      vimPlugins.vim-polyglot
      vimPlugins.vim-projectionist
      vimPlugins.vim-repeat
      vimPlugins.vim-sleuth
      vimPlugins.vim-surround
      vimPlugins.vim-terraform
      vimPlugins.vim-textobj-user
      vimPlugins.vim-tmux-navigator
      vimPlugins.vim-unimpaired

      vimPlugins.lualine-nvim
      vimPlugins.lualine-lsp-progress

      {
        plugin = vimPlugins.vim-sort-motion;
        type = "lua";
        config = ''
          vim.g.sort_motion_flags = "ui"
        '';
      }
      {
        plugin = vimPlugins.treesj;
        type = "lua";
        config = ''
          require "treesj".setup {}
        '';
      }
      # Testing.
      {
        plugin = vimPlugins.neoterm;
        type = "lua";
        config = ''
          vim.g.neoterm_autoscroll = 1
          vim.g.neoterm_default_mod = "vertical"
          vim.g.neoterm_term_per_tab = 1
        '';
      }
      vimPlugins.vim-test

      # Git
      vimPlugins.vim-fugitive
      vimPlugins.vim-rhubarb

      # Debugging
      vimPlugins.nvim-dap
      vimPlugins.nvim-dap-ui
      vimPlugins.nvim-dap-virtual-text

      # Treesitter
      vimPlugins.nvim-treesitter.withAllGrammars
      vimPlugins.nvim-treesitter-context
      vimPlugins.nvim-treesitter-textobjects

      # LSP, linting and formatting
      pkgsUnstable.vimPlugins.conform-nvim
      pkgsUnstable.vimPlugins.none-ls-nvim
      vimPlugins.lsp-status-nvim
      vimPlugins.nvim-lspconfig

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
      vimPlugins.phpactor

      # Snippets
      vimPlugins.friendly-snippets
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
      php81

      # Language servers
      ansible-language-server
      gopls
      lua-language-server
      nodePackages.intelephense
      nodePackages."@astrojs/language-server"
      nodePackages."@tailwindcss/language-server"
      nodePackages.bash-language-server
      nodePackages.dockerfile-language-server-nodejs
      nodePackages.typescript-language-server
      nodePackages.vls
      nodePackages.volar
      nodePackages.vscode-langservers-extracted
      nodePackages.vue-language-server
      nodePackages.yaml-language-server
      phpactor
      pkgsUnstable.nixd
      rnix-lsp
      terraform-ls

      # Formatters
      black
      rstfmt
      stylua

      # Tools
      html-tidy
      nodePackages.markdownlint-cli
      proselint
      shellcheck
    ];
  };
}
