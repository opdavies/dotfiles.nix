local luasnip = require "luasnip"
local fmta = require("luasnip.extras.fmt").fmta

local insert = luasnip.insert_node
local snippet = luasnip.snippet

return {
  snippet({ trig = "log", dscr = "console.log" }, fmta("console.log(<>);", { insert(1, "value") })),
}
