local fmt = require("luasnip.extras.fmt").fmt
local ls = require "luasnip"

local i = ls.insert_node

local M = {
  frontmatter = fmt(
    [[
    ---
    title: {}
    ---
    {}
    ]],
    { i(1), i(0) }
  ),

  link = fmt([[[{}]({}){} ]], { i(1), i(2), i(0) }),
}

return M
