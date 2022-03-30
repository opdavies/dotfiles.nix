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

  -- Utilities
  use "cakebaker/scss-syntax.vim"
  use "christoomey/vim-sort-motion"
  use "christoomey/vim-tmux-navigator"
  use "editorconfig/editorconfig-vim"
  use "folke/twilight.nvim"
  use "folke/zen-mode.nvim"
  use "icatalina/vim-case-change"
  use "j-hui/fidget.nvim"
  use "kazhala/close-buffers.nvim"
  use "kyazdani42/nvim-web-devicons"
  use "lewis6991/gitsigns.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "machakann/vim-highlightedyank"
  use "miyakogi/seiya.vim"
  use "norcalli/nvim-colorizer.lua"
  use "numToStr/Comment.nvim"
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "rcarriga/nvim-notify"
  use "sheerun/vim-polyglot"
  use "theprimeagen/refactoring.nvim"
  use "tjdevries/express_line.nvim"
  use "tpope/vim-surround"
  use "vim-test/vim-test"
  use "voldikss/vim-floaterm"
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
  use "ray-x/lsp_signature.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

  -- Git
  use 'TimUntersberger/neogit'

end)
