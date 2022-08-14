local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {}
    end,
  },
}

return packer.startup(function()
  local use = packer.use

  use "wbthomason/packer.nvim"

  -- Tmux
  use "preservim/vimux"

  -- Utilities
  use "aca/emmet-ls"
  use "andymass/vim-matchup"
  use "cakebaker/scss-syntax.vim"
  use "christoomey/vim-sort-motion"
  use "christoomey/vim-tmux-navigator"
  use "editorconfig/editorconfig-vim"
  use "folke/twilight.nvim"
  use "folke/zen-mode.nvim"
  use "icatalina/vim-case-change"
  use "j-hui/fidget.nvim"
  use "junegunn/vim-easy-align"
  use "kazhala/close-buffers.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "lewis6991/gitsigns.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "machakann/vim-highlightedyank"
  use "miyakogi/seiya.vim"
  use "mkitt/tabline.vim"
  use "monaqa/dial.nvim"
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "rcarriga/nvim-notify"
  use "sheerun/vim-polyglot"
  use "theprimeagen/git-worktree.nvim"
  use "theprimeagen/refactoring.nvim"
  use "tjdevries/express_line.nvim"
  use "tpope/vim-repeat"
  use "tpope/vim-surround"
  use "vim-test/vim-test"
  use { "mg979/vim-visual-multi", branch = "master" }

  -- Themes
  use {
    "tjdevries/gruvbuddy.nvim",
    requires = {
      "tjdevries/colorbuddy.vim",
    },
  }

  -- Navigation
  use "ThePrimeagen/harpoon"
  use "tamago324/lir-git-status.nvim"
  use "tamago324/lir.nvim"

  -- Treesitter
  use "nvim-treesitter/playground"
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Completion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip",
      {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
      },
    },
  }

  -- Snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"

  -- LSP
  use "jose-elias-alvarez/null-ls.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-lua/lsp-status.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "nvim-telescope/telescope-dap.nvim"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-ui-select.nvim" }

  -- Git
  use 'TimUntersberger/neogit'

  -- Databases
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-completion"
  use "kristijanhusak/vim-dadbod-ui"

  -- Text objects
  use "kana/vim-textobj-indent"
  use "kana/vim-textobj-user"
  use "vim-scripts/argtextobj.vim"
  use "wellle/targets.vim"

  -- Markdown
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
end)
