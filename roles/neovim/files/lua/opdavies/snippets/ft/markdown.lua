local fmt = require("luasnip.extras.fmt").fmt
local luasnip = require "luasnip"

local i = luasnip.insert_node
local s = luasnip.snippet

return {
  s(
    { trig = "frontmatter", dscr = "Document frontmatter" },
    fmt(
      [[
      ---
      title: {}
      ---
      {}
      ]],
      { i(1), i(0) }
    )
  ),
}
