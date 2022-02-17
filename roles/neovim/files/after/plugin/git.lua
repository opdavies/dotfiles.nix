local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup {
  disable_commit_confirmation = true,
}

local nmap = require('opdavies.keymap').nmap

nmap({ "<leader>gg", "<cmd>Neogit<cr>" })
nmap({ "<leader>gl", "<cmd>Neogit log<cr>" })
nmap({ "<leader>gp", "<cmd>Neogit push<cr>" })
