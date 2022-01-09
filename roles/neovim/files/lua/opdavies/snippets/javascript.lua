local luasnip = require "luasnip"
local snippet = luasnip.s

local insert = luasnip.insert_node
local text = luasnip.text_node

return {
  snippet({ trig = "log", dscr = "console.log" }, { text "console.log(", insert(1, "value"), text ");" }),
}
