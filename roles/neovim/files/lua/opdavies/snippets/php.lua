local luasnip = require "luasnip"
local snippet = luasnip.s

local choice = luasnip.choice_node
local insert = luasnip.insert_node
local text = luasnip.text_node

return {
  snippet({ trig = "test", dscr = "Test block" }, {
    text { "/* @test **/", "" },
    text "public function ",
    choice(1, {
      text "test",
      text "it",
      text "should",
    }),
    insert(2), -- The method name.
    text { "(): void {", "" },
    text "  ",
    insert(0), -- The method body.
    text { "", "}" },
  }),
}
