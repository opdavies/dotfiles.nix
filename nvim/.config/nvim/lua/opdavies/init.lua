vim.g.mapleader = ' '

vim.cmd 'autocmd BufRead,BufNewFile *.test set filetype=php'
vim.cmd 'autocmd FileType gitcommit highlight ColorColumn ctermbg=8'
vim.cmd 'autocmd FileType gitcommit setlocal colorcolumn=50,72'
vim.cmd 'autocmd FileType gitcommit setlocal spell'
vim.cmd 'autocmd FileType gitcommit setlocal textwidth=72'

vim.cmd 'filetype indent on'
vim.cmd 'filetype on'
vim.cmd 'filetype plugin on'

vim.cmd 'highlight Comment cterm=italic gui=italic'

vim.cmd 'syntax on'

vim.o.autoindent = true
vim.o.breakindent = true
vim.o.expandtab = true
vim.o.foldmethod = 'indent'
vim.o.formatoptions = 'lm'
vim.o.linebreak = true
vim.o.mouse = 'n'
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.updatetime = 1000
vim.o.wrap = true

vim.opt.clipboard:append 'unnamedplus'

local options = { noremap = true }

vim.api.nvim_set_keymap('n', '<Leader>so', ':so ~/.config/nvim/init.vim<Cr>', options)

-- Make the current file executable
vim.api.nvim_set_keymap('n', '<Leader>x', ':!chmod +x %<Cr>', options)

-- Yank from the current column to the end of the line
vim.api.nvim_set_keymap('n', 'Y', 'yg$', options)

-- Keep things centred
vim.api.nvim_set_keymap('n', 'n', 'nzzzv', options)
vim.api.nvim_set_keymap('n', 'N', 'Nzzzv', options)

-- Remove arrow keys
vim.api.nvim_set_keymap('v', '<down>', '<nop>', options)
vim.api.nvim_set_keymap('v', '<left>', '<nop>', options)
vim.api.nvim_set_keymap('v', '<right>', '<nop>', options)
vim.api.nvim_set_keymap('v', '<up>', '<nop>', options)

vim.api.nvim_set_keymap('n', '<Leader>k', ':nohlsearch', options)

require('packer').startup(function()
  -- Utilities
  use 'cakebaker/scss-syntax.vim'
  use 'christoomey/vim-sort-motion'
  use 'christoomey/vim-tmux-navigator'
  use 'editorconfig/editorconfig-vim'
  use 'icatalina/vim-case-change'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'machakann/vim-highlightedyank'
  use 'mattn/emmet-vim'
  use 'miyakogi/seiya.vim'
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'
  use 'preservim/nerdcommenter'
  use 'sheerun/vim-polyglot'
  use 'tpope/vim-surround'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'
  use { 'mg979/vim-visual-multi', branch = 'master' }

  -- Themes
  use 'arcticicestudio/nord-vim'
  use 'nanotech/jellybeans.vim'
  use 'tjdevries/colorbuddy.vim'
  use 'tjdevries/gruvbuddy.nvim'

  -- Navigation
  use 'ThePrimeagen/harpoon'

  -- Treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Completion
  use 'L3MON4D3/LuaSnip'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'onsails/lspkind-nvim'
  use 'saadparwaiz1/cmp_luasnip'
  use { 'tzachar/cmp-tabnine', run = './install.sh' }

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
end)

require "opdavies.plugins.colours"
require "opdavies.plugins.completion"
require "opdavies.plugins.floaterm"
require "opdavies.plugins.indent-blankline"
require "opdavies.plugins.lsp"
require "opdavies.plugins.signs"
require "opdavies.plugins.treesitter"
