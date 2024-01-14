local M = {}

local function set_autocmd()
  vim.cmd [[
    autocmd BufRead,BufNewFile *.test set filetype=php

    autocmd FileType gitcommit highlight ColorColumn ctermbg=8
    autocmd FileType gitcommit setlocal colorcolumn=50,72
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal textwidth=72
  ]]

  -- Cursorline highlighting control.
  --  Only have it on in the current buffer.
  local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
  local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
      group = group,
      pattern = pattern,
      callback = function()
        vim.opt_local.cursorline = value
      end,
    })
  end
  set_cursorline("WinLeave", false)
  set_cursorline("WinEnter", true)
  set_cursorline("FileType", false, "TelescopePrompt")

  vim.api.nvim_create_autocmd("TermOpen", {
    callback = function()
      vim.cmd.set "filetype=term"
    end,
  })
end

local function set_filetypes()
  vim.cmd [[
    filetype indent on
    filetype on
    filetype plugin on
  ]]
end

local function set_key_mappings()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map("n", "<Leader>so", ":call opdavies#save_and_exec()<CR>", options)

  -- Format paragraphs to an 80 character line length.
  map("n", "<Leader>g", "gqap", options)
  map("x", "<Leader>g", "gqa", options)

  -- Make the current file executable
  map("n", "<Leader>x", ":!chmod +x %<Cr>", options)

  -- Yank from the current column to the end of the line
  map("n", "Y", "yg$", options)

  -- Keep things centred
  map("n", "n", "nzzzv", options)
  map("n", "N", "Nzzzv", options)

  -- Remove arrow keys
  map("v", "<down>", "<nop>", options)
  map("v", "<left>", "<nop>", options)
  map("v", "<right>", "<nop>", options)
  map("v", "<up>", "<nop>", options)

  -- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
  vim.cmd [[ nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}() ]]

  map("n", "<C-f>", ":silent !tmux neww tmux-sessioniser<CR>", { noremap = true, silent = true })

  local keymap = require "opdavies.keymap"
  local imap = keymap.imap
  local nmap = keymap.nmap
  local vmap = keymap.vmap
  local xmap = keymap.xmap

  -- Easy insertion of a trailing ; or , from insert mode
  imap { ",,", "<Esc>A,<Esc>" }
  imap { ";;", "<Esc>A;<Esc>" }

  nmap { "ga", "<Plug>(EasyAlign)" }
  xmap { "ga", "<Plug>(EasyAlign)" }

  -- Focus on the current buffer.
  nmap { "<leader>-", ":wincmd _<cr>:wincmd |<cr>", { noremap = true, silent = true } }

  -- Automatically resize buffers.
  nmap { "<leader>=", ":wincmd =<cr>", { noremap = true, silent = true } }

  -- Move line(s) up and down.
  local opts = { noremap = true, silent = true }
  imap { "<M-j>", "<Esc>:m .+1<CR>==gi", opts }
  imap { "<M-k>", "<Esc>:m .-2<CR>==gi", opts }
  nmap { "<M-j>", ":m .+1<CR>==", opts }
  nmap { "<M-k>", ":m .-2<CR>==", opts }
  vmap { "<M-j>", ":m '>+1<CR>gv=gv", opts }
  vmap { "<M-k>", ":m '<-2<CR>gv=gv", opts }

  -- Move half a screen up or down and re-center.
  nmap { "<C-d>", "<C-d>zz" }
  nmap { "<C-u>", "<C-u>zz" }
end

local function set_highlights()
  vim.cmd [[highlight Comment cterm=italic gui=italic]]
end

local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    autoindent = true,
    backup = false,
    breakindent = true,
    conceallevel = 0,
    cursorline = true,
    expandtab = true,
    foldlevel = 1,
    foldlevelstart = 99,
    foldmethod = "indent",
    formatoptions = "lm",
    hidden = false,
    inccommand = "split",
    linebreak = true,
    list = true,
    mouse = "n",
    number = true,
    pumblend = 10,
    pumheight = 10,
    relativenumber = true,
    scrolloff = 10,
    shiftwidth = 2,
    showmode = false,
    signcolumn = "yes:1",
    smartindent = true,
    softtabstop = 2,
    splitbelow = false,
    splitright = true,
    swapfile = false,
    syntax = "on",
    tabstop = 2,
    termguicolors = true,
    textwidth = 0,
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    updatetime = 1000,
    wrap = false,
  }

  for key, value in pairs(settings) do
    vim.o[key] = value
  end

  vim.opt.backupdir:remove "." -- keep backups out of the current directory
  vim.opt.clipboard:append "unnamedplus"
  vim.opt.listchars:append {
    trail = "·",
  }
  vim.opt.completeopt = { "menu", "menuone", "noselect" }
  vim.opt.laststatus = 3
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
