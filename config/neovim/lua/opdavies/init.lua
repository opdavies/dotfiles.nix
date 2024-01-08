pcall("require", impatient)

require "opdavies.globals"

require("opdavies.options").setup()

require "opdavies.lsp"

require "opdavies.telescope.setup"
require "opdavies.telescope.mappings"

vim.api.nvim_create_user_command("GoToFile", function()
  require("opdavies.telescope").git_files()
end, {})

local imap = require("opdavies.keymap").imap
local nmap = require("opdavies.keymap").nmap
local xmap = require("opdavies.keymap").xmap

-- Quicker macro playback.
nmap { "Q", "@qj" }
xmap { "Q", ":norm @q<CR>" }
