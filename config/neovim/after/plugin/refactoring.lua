local status_ok, refactoring = pcall(require, "refactoring")
if not status_ok then
  return
end

local nmap = require("opdavies.keymap").nmap
local vmap = require("opdavies.keymap").vmap

-- TODO: add keymaps - https://github.com/ThePrimeagen/refactoring.nvim#configuration-for-refactoring-operations
refactoring.setup {}

local opts = { silent = true }

nmap { "<Leader>ri", "<Cmd>lua require 'refactoring'.refactor 'Inline Variable'<Cr>", opts }

vmap { "<Leader>re", "<Esc><Cmd>lua require 'refactoring'.refactor 'Extract Function'<Cr>", opts }
vmap { "<Leader>ri", "<Esc><Cmd>lua require 'refactoring'.refactor 'Inline Variable'<Cr>", opts }
vmap { "<Leader>rv", "<Esc><Cmd>lua require 'refactoring'.refactor 'Extract Variable'<Cr>", opts }
