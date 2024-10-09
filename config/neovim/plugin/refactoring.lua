local refactoring = require "refactoring"

-- TODO: add keymaps - https://github.com/ThePrimeagen/refactoring.nvim#configuration-for-refactoring-operations
refactoring.setup {}

local opts = { silent = true }

vim.keymap.set("n", "<Leader>ri", "<Cmd>lua require 'refactoring'.refactor 'Inline Variable'<Cr>", opts)

vim.keymap.set("v", "<Leader>re", "<Esc><Cmd>lua require 'refactoring'.refactor 'Extract Function'<Cr>", opts)
vim.keymap.set("v", "<Leader>ri", "<Esc><Cmd>lua require 'refactoring'.refactor 'Inline Variable'<Cr>", opts)
vim.keymap.set("v", "<Leader>rv", "<Esc><Cmd>lua require 'refactoring'.refactor 'Extract Variable'<Cr>", opts)
