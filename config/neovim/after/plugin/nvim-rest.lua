local status_ok, rest_nvim = pcall(require, "rest-nvim")
if not status_ok then
  return
end

local nmap = require("opdavies.keymap").nmap

-- Run the request.
nmap { "<leader>rr", "require('rest-nvim').run()" }

-- Preview the request.
nmap { "<leader>rp", "require('rest-nvim').run(true)" }

-- Re-run the last request.
nmap { "<leader>rl", "require('rest-nvim').last()" }

rest_nvim.setup()
