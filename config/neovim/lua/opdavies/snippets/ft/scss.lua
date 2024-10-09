local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local i = ls.insert_node

local M = {
  bp = fmta("@include breakpoint(<>) {\n  <>\n}", { i(1), i(0) }),
}

return M
