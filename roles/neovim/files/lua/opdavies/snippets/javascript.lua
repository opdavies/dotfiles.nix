local fmta = require("luasnip.extras.fmt").fmta
local luasnip = require "luasnip"

local i = luasnip.insert_node
local s = luasnip.snippet

return {
  s({ trig = "log", dscr = "console.log" }, fmta("console.log(<>);", { i(1, "value") })),
}
