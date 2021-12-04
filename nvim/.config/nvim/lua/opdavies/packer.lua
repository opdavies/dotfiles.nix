require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Utilities
  use 'cakebaker/scss-syntax.vim'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'icatalina/vim-case-change'
  use 'kyazdani42/nvim-web-devicons'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'machakann/vim-highlightedyank'
  use 'miyakogi/seiya.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'numToStr/Comment.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Themes
  use {
    'tjdevries/gruvbuddy.nvim',
    requires = {
      'tjdevries/colorbuddy.vim'
    },
  }

  -- Navigation
  use 'ThePrimeagen/harpoon'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- Completion
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'onsails/lspkind-nvim',
      'saadparwaiz1/cmp_luasnip',
      {
        'tzachar/cmp-tabnine',
        run = './install.sh'
      }
    }
  }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'vimwiki/vimwiki'
end)
