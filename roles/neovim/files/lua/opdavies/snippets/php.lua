local luasnip = require "luasnip"
local fmta = require("luasnip.extras.fmt").fmta

local choice = luasnip.choice_node
local insert = luasnip.insert_node
local snippet = luasnip.snippet
local text = luasnip.text_node

return {
  snippet(
    "test",
    fmta(
      [[
        /** @test */
        public function <><>(): void {
          <>
        }
      ]],
      {
        choice(1, {
          text "test",
          text "it",
          text "should",
        }),
        insert(2),
        insert(0),
      }
    )
  ),
}
