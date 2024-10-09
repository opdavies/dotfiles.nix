local set = vim.keymap.set

set("n", "<Leader>so", ":call opdavies#save_and_exec()<CR>")

-- Format paragraphs to an 80 character line length.
set("n", "<Leader>g", "gqap")
set("x", "<Leader>g", "gqa")

-- Make the current file executable
set("n", "<Leader>x", ":!chmod +x %<Cr>")

-- Yank from the current column to the end of the line
set("n", "Y", "yg$")

-- Keep things centred
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Disable up and down arrow keys.
set("v", "<down>", "<nop>")
set("v", "<up>", "<nop>")

-- Use the left and right arrow keys to change tabs.
set("v", "<left>", "gT")
set("v", "<right>", "gt")

-- Easily switch back to visual mode.
set("i", "jk", "<Esc>")

-- Easy insertion of a trailing ; or , from insert mode
set("i", ",,", "<Esc>A,<Esc>")
set("i", ";;", "<Esc>A;<Esc>")

set("n", "ga", "<Plug>(EasyAlign)")
set("x", "ga", "<Plug>(EasyAlign)")

-- Focus on the current buffer.
set("n", "<leader>-", ":wincmd _<cr>:wincmd |<cr>", { noremap = true, silent = true })

-- Automatically resize buffers.
set("n", "<leader>=", ":wincmd =<cr>", { noremap = true, silent = true })

-- Move line(s) up and down.
local opts = { noremap = true, silent = true }
set("i", "<M-j>", "<Esc>:m .+1<CR>==gi", opts)
set("i", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
set("n", "<M-j>", ":m .+1<CR>==", opts)
set("n", "<M-k>", ":m .-2<CR>==", opts)
set("v", "<M-j>", ":m '>+1<CR>gv=gv", opts)
set("v", "<M-k>", ":m '<-2<CR>gv=gv", opts)

-- Re-centre when navigating.
set("n", "#", "#zz", opts)
set("n", "%", "%zz", opts)
set("n", "*", "*zz", opts)
set("n", "<C-d>", "<C-d>zz", opts)
set("n", "<C-i>", "<C-i>zz", opts)
set("n", "<C-o>", "<C-o>zz", opts)
set("n", "<C-u>", "<C-u>zz", opts)
set("n", "G", "Gzz", opts)
set("n", "N", "Nzz", opts)
set("n", "gg", "ggzz", opts)
set("n", "n", "Nzz", opts)
set("n", "{", "{zz", opts)
set("n", "}", "}zz", opts)

-- Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
vim.cmd [[ nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}() ]]

-- Quicker macro playback.
set("n", "Q", "@qj")
set("x", "Q", ":norm @q<CR>")

-- Easier navigation between splits.
set("n", "<C-h>", "<C-w><C-h>")
set("n", "<C-j>", "<C-w><C-j>")
set("n", "<C-k>", "<C-w><C-k>")
set("n", "<C-l>", "<C-w><C-l>")

set("v", "Q", "<nop>")

set("v", "J", ":m '>+1<CR>gvrgv")
set("v", "K", ":m '<-2<CR>gv=gv")

set("n", "J", "mzJ`z")
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- Easily access project-specific notes.
set("n", "<leader>en", function()
  if vim.fn.filereadable ".ignored/notes" == 1 then
    vim.cmd "tabnew .ignored/notes"
  else
    vim.cmd "tabnew notes"
  end
end)

-- Easily access project-specific todos.
set("n", "<leader>et", function()
  if vim.fn.filereadable ".ignored/todo" == 1 then
    vim.cmd "tabnew .ignored/todo"
  else
    vim.cmd "tabnew todo"
  end
end)

set("n", "<leader>ec", ":edit composer.json")
