local harpoon = require "harpoon"
local nmap = require("opdavies.keymap").nmap

harpoon:setup()

nmap {
  "<leader>hl",
  function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end,
}
nmap {
  "<leader>hm",
  function()
    harpoon:list():append()
  end,
}

for i = 1, 5 do
  nmap {
    string.format("<space>%s", i),
    function()
      harpoon:list():select(i)
    end,
  }
end
