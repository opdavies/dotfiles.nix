vim.g.mapleader = ' '

vim.cmd('filetype indent on')
vim.cmd('filetype on')
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.clipboard:append 'unnamedplus'
vim.opt.expandtab = true
vim.opt.foldmethod = 'indent'
vim.opt.formatoptions = 'lm'
vim.opt.linebreak = true
vim.opt.mouse = 'n'
vim.opt.number = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.updatetime = 1000
vim.opt.wrap = true

require "opdavies.plugins.colours"
require "opdavies.plugins.completion"
require "opdavies.plugins.floaterm"
require "opdavies.plugins.indent-blankline"
require "opdavies.plugins.lsp"
require "opdavies.plugins.signs"
require "opdavies.plugins.treesitter"
