local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end

neogit.setup {
  disable_commit_confirmation = true,
}

local nmap = require('opdavies.keymap').nmap

nmap { "<leader>gc", function() neogit.open { "commit" } end }
nmap { "<leader>gl", function() neogit.open { "log" } end }
nmap { "<leader>gp", function() neogit.open { "push" } end }
nmap { "<leader>gs", neogit.open }
