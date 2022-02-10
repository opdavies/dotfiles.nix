local fmt = require("luasnip.extras.fmt").fmt
local ls = require "luasnip"
local rep = require("luasnip.extras").rep

local i = ls.insert_node

return {
  req = fmt("local {} = require('{}')", { i(1), rep(1) })
}
