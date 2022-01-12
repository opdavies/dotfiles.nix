local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local i = ls.insert_node

local M = {
  log = fmta("console.log(<>);", { i(1, "value") }),
}

return M
