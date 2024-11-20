local augend = require "dial.augend"
local dial_config = require "dial.config"

dial_config.augends:register_group {
  visual = {
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.date.alias["%Y/%m/%d"],
    augend.constant.alias.alpha,
    augend.constant.alias.Alpha,
  },

  mygroup = {
    augend.constant.new {
      elements = { "TRUE", "FALSE" },
      word = true,
      cyclic = true,
    },

    augend.constant.new {
      elements = { "public", "protected", "private" },
      word = true,
      cyclic = true,
    },

    augend.constant.new {
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    },

    augend.date.alias["%d/%m/%Y"],
    augend.constant.alias.bool, -- boolean value (true <-> false)
    augend.integer.alias.decimal,
    augend.integer.alias.hex,
    augend.semver.alias.semver,
  },
}

local dial_map = require "dial.map"

vim.keymap.set("n", "<C-a>", dial_map.inc_normal "mygroup")
vim.keymap.set("n", "<C-x>", dial_map.dec_normal "mygroup")
vim.keymap.set("v", "<C-a>", dial_map.inc_normal "visual")
vim.keymap.set("v", "<C-x>", dial_map.dec_normal "visual")
