require("harpoon").setup {}

local nmap = require("opdavies.keymap").nmap

local mark = require "harpoon.mark"
local ui = require "harpoon.ui"

nmap { "<C-e>", ui.toggle_quick_menu }
nmap { "<leader>a", mark.add_file }

for key, letter in ipairs { "h", "j", "k", "l" } do
  nmap {
    string.format("<C-%s>", letter),
    function()
      ui.nav_file(key)
    end,
  }
end
