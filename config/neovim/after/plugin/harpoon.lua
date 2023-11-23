local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  return
end

local nmap = require("opdavies.keymap").nmap

harpoon.setup {}

nmap { "<M-h><M-l>", require("harpoon.ui").toggle_quick_menu }
nmap { "<M-h><M-m>", require("harpoon.mark").add_file }

nmap { "<leader>hl", require("harpoon.ui").toggle_quick_menu }
nmap { "<leader>hm", require("harpoon.mark").add_file }

for i = 1, 5 do
  nmap {
    string.format("<space>%s", i),
    function()
      require("harpoon.ui").nav_file(i)
    end,
  }
end
