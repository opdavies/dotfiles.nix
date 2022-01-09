local fmta = require("luasnip.extras.fmt").fmta
local luasnip = require "luasnip"

local c = luasnip.choice_node
local i = luasnip.insert_node
local s = luasnip.snippet
local t = luasnip.text_node

return {
  s(
    "test",
    fmta(
      [[
        /** @test */
        public function <><>(): void {
          <>
        }
      ]],
      {
        c(1, {
          t "test",
          t "it",
          t "should",
        }),
        i(2),
        i(0),
      }
    )
  ),
}
