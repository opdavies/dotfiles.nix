local status_ok, dial_config = pcall(require, "dial.config")
if not status_ok then
  return
end

local augend = require "dial.augend"

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
    augend.semver.alias.semver
  },
}

local dial_map = require "dial.map"

local nmap = require "opdavies.keymap".nmap
local vmap = require "opdavies.keymap".vmap

nmap({ "<C-a>", dial_map.inc_normal "mygroup" })
nmap({ "<C-x>", dial_map.dec_normal "mygroup" })
vmap({ "<C-a>", dial_map.inc_normal "visual" })
vmap({ "<C-x>", dial_map.dec_normal "visual" })
