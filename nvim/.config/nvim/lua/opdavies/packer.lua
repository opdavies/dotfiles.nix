local function packer_startup()
  require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Utilities
    use 'cakebaker/scss-syntax.vim'
    use 'christoomey/vim-sort-motion'
    use 'christoomey/vim-tmux-navigator'
    use 'editorconfig/editorconfig-vim'
    use 'icatalina/vim-case-change'
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require 'opdavies.plugins.gitsigns'.init()
      end
    }
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require 'opdavies.plugins.indent-blankline'.init()
      end
    }
    use 'machakann/vim-highlightedyank'
    use {
      'miyakogi/seiya.vim',
      config = function()
        require 'opdavies.plugins.seiya'.init()
      end
    }
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'preservim/nerdcommenter'
    use 'sheerun/vim-polyglot'
    use 'tpope/vim-surround'
    use {
      'vim-test/vim-test',
      config = function ()
        require 'opdavies.plugins.vim-test'.init()
      end
    }
    use {
      'voldikss/vim-floaterm',
      config = function()
        require 'opdavies.plugins.floaterm'.init()
      end
    }
    use { 'mg979/vim-visual-multi', branch = 'master' }

    -- Themes
    use {
      'tjdevries/gruvbuddy.nvim',
      requires = {
        'tjdevries/colorbuddy.vim'
      },
      config = function()
        require 'opdavies.plugins.colours'.init()
      end
    }

    -- Navigation
    use 'ThePrimeagen/harpoon'

    -- Treesitter
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require 'opdavies.plugins.treesitter'.init()
      end
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
      },
      config = {
        require 'opdavies.plugins.completion'.init()
      }
    }

    -- LSP
    use {
      'neovim/nvim-lspconfig',
      config = function()
        require 'opdavies.plugins.lspconfig'.init()
      end
    }

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      config = function ()
        require 'opdavies.plugins.telescope'.init()
      end
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    use 'vimwiki/vimwiki'
  end)
end

local function init()
  packer_startup()
end

return {
  init = init
}
