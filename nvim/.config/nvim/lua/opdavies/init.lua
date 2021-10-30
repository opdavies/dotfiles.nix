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
require "opdavies.plugins.colours"
require "opdavies.plugins.completion"
require "opdavies.plugins.floaterm"
require "opdavies.plugins.indent-blankline"
require "opdavies.plugins.lsp"
require "opdavies.plugins.signs"
require "opdavies.plugins.treesitter"
