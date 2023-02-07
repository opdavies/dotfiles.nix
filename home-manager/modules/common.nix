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
    exa
    file
    fzf
    gcc
    gh
    git
    git-crypt
    inotify-tools
    just
    tree-sitter
    htop
    jq
    lua
    mysql
    neofetch
    nodejs
    nodePackages."http-server"
    php81
    php81Packages.composer
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
    xcp
    yarn
    zoxide

    # LSP
    gopls
    html-tidy
    nodePackages."@ansible/ansible-language-server"
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
    package = pkgs.neovim-nightly;

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

      customVim.vim-heritage = pkgs.vimUtils.buildVimPlugin {
        name = "vim-heritage";
        src = pkgs.fetchFromGitHub {
          owner = "jessarcher";
          repo = "vim-heritage";
          rev = "cffa05c78c0991c998adc4504d761b3068547db6";
          sha256 = "Lebe5V1XFxn4kSZ+ImZ69Vst9Nbc0N7eA9IzOCijFS0=";
        };
      };

      customVim.vim-just = pkgs.vimUtils.buildVimPlugin {
        name = "vim-just";
        src = pkgs.fetchFromGitHub {
          owner = "NoahTheDuke";
          repo = "vim-just";
          rev = "838c9096d4c5d64d1000a6442a358746324c2123";
          sha256 = "51b8PxyKqBdeIvmmZyF2hpMBjkyrlZDdTB1opr5JZ7Y=";
        };
      };

      customVim.vim-textobj-xmlattr = pkgs.vimUtils.buildVimPlugin {
        name = "vim-textobj-xmlattr";
        src = pkgs.fetchFromGitHub {
          owner = "whatyouhide";
          repo = "vim-textobj-xmlattr";
          rev = "694a297f1d75fd527e87da9769f3c6519a87ebb1";
          sha256 = "+91FVP95oh00flINdltqx6qJuijYo56tHIh3J098G2Q=";
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

      customVim.vim-caser = pkgs.vimUtils.buildVimPlugin {
        name = "vim-caser";
        src = pkgs.fetchFromGitHub {
          owner = "arthurxavierx";
          repo = "vim-caser";
          rev = "master";
          sha256 = "PXAY01O/cHvAdWx3V/pyWFeiV5qJGvLcAKhl5DQc0Ps=";
        };
      };

      customVim.vim-visual-star-search = pkgs.vimUtils.buildVimPlugin {
        name = "vim-visual-star-search";
        src = pkgs.fetchFromGitHub {
          owner = "nelstrom";
          repo = "vim-visual-star-search";
          rev = "37259722f45996733fd309add61385a4ad88bdb9";
          sha256 = "n8jd6fy30XukZ9NFZX5qclSlMfziP/Ew9dXfkysRl4Y=";
        };
      };
    in with pkgs; [
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
      vimPlugins.neogit
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
      vimPlugins.vim-pasta
      vimPlugins.vim-polyglot
      vimPlugins.vim-repeat
      vimPlugins.vim-sleuth
      vimPlugins.vim-surround
      vimPlugins.vim-test
      vimPlugins.vim-textobj-user
      vimPlugins.vim-tmux-navigator
      vimPlugins.vim-unimpaired
      vimPlugins.vimux

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
      vimPlugins.telescope-live-grep-args-nvim
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

  xdg.configFile.alacritty = {
    source = ../../config/alacritty;
    recursive = true;
  };

  xdg.configFile.bin = {
    source = ../../bin;
    recursive = true;
  };

  xdg.configFile.nvim = {
    source = ../../config/neovim;
    recursive = true;
  };
}
