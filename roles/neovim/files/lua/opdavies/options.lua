local M = {}

local function set_autocmd()
  vim.cmd[[
    autocmd BufRead,BufNewFile *.test set filetype=php

    autocmd BufWritePost plugins.lua luafile %
    autocmd BufWritePost plugins.lua PackerSync

    autocmd FileType gitcommit highlight ColorColumn ctermbg=8
    autocmd FileType gitcommit setlocal colorcolumn=50,72
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal textwidth=72
  ]]
end

local function set_filetypes()
  vim.cmd[[
    filetype indent on
    filetype on
    filetype plugin on
  ]]
end

local function set_key_mappings()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<Leader>so', ':luafile ~/.config/nvim/init.lua<Cr>', options)

  -- Format paragraphs to an 80 character line length.
  map('n', '<Leader>g', 'gqap', options)
  map('x', '<Leader>g', 'gqa', options)

  -- Make the current file executable
  map('n', '<Leader>x', ':!chmod +x %<Cr>', options)

  -- Yank from the current column to the end of the line
  map('n', 'Y', 'yg$', options)

  -- Keep things centred
  map('n', 'n', 'nzzzv', options)
  map('n', 'N', 'Nzzzv', options)

  -- Remove arrow keys
  map('v', '<down>', '<nop>', options)
  map('v', '<left>', '<nop>', options)
  map('v', '<right>', '<nop>', options)
  map('v', '<up>', '<nop>', options)

  -- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
  vim.cmd[[ nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}() ]]

  map(
    'n',
    '<C-f>',
    ':silent !tmux neww tmux-sessioniser<CR>',
    { noremap = true, silent = true }
  )
end

local function set_highlights()
  vim.cmd[[highlight Comment cterm=italic gui=italic]]
end

local function set_vim_g()
  vim.g.mapleader = ' '
end

local function set_vim_o()
  local settings = {
    autoindent = true,
    breakindent = true,
    conceallevel = 0,
    expandtab = true,
    foldlevel = 1,
    foldlevelstart = 1,
    foldmethod = 'indent',
    formatoptions = 'lm',
    linebreak = true,
    mouse = 'n',
    number = true,
    pumblend = 10,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 10,
    shiftwidth = 2,
    showmode = false,
    smartindent = true,
    softtabstop = 2,
    splitbelow = true,
    splitright = true,
    swapfile = false,
    syntax = 'on',
    tabstop = 2,
    termguicolors = true,
    textwidth = 0,
    updatetime = 1000,
    wrap = true,
  }

  for key, value in pairs(settings) do
    vim.o[key] = value
  end

  vim.opt.clipboard:append 'unnamedplus'
end

M.setup = function()
  set_vim_g()
  set_vim_o()
  set_key_mappings()
  set_autocmd()
  set_filetypes()
  set_highlights()

  vim.g.snippets = "luasnip"
end

return M
