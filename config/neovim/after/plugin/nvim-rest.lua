local status_ok, rest_nvim = pcall(require, "rest-nvim")
if not status_ok then
  return
end

rest_nvim.setup()

local nmap = require("opdavies.keymap").nmap

nmap { "<leader>rr", "<plug>RestNvim<cr>" }
nmap { "<leader>rp", "<plug>RestNvimPreview<cr>" }
nmap { "<leader>rl", "<plug>RestNvimLast<cr>" }
