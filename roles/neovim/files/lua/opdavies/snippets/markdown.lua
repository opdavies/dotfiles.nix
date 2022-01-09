local luasnip = require "luasnip"
local snippet = luasnip.s

local insert = luasnip.insert_node
local text = luasnip.text_node

return {
  snippet({ trig = "frontmatter", dscr = "Document frontmatter" }, {
    text { "---", "tags: " },
    insert(1, "value"),
    text { "", "---", "" },
    insert(0),
  }),
}
