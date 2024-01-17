local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node

local M = {
  __construct = fmta(
    [[
    public function __construct(<>) {
      <>
    }
  ]],
    { i(1), i(0) }
  ),

  __invoke = fmta(
    [[
    public function __invoke(<>) {
      <>
    }
  ]],
    { i(1), i(0) }
  ),

  func = fmta("function <>(<>)<> {\n  <>\n}<>", { i(1), i(2), i(3), i(4), i(0) }),

  met = fmta(
    [[
    <> function <>(<>)<> {
      <>
    }<>
    ]],
    { c(1, { t "public", t "protected", t "private" }), i(2), i(3), i(4), i(5), i(0) }
  ),

  pest = fmta("<>('<>', function() {\n  <>\n});", { c(1, { t "it", t "test" }), i(2), i(0) }),

  test = fmta(
    [[
    public function test<>(): void {
      <>
    }<>
    ]],
    { i(1), i(2), i(0) }
  ),

  testa = fmta(
    [[
    /** @test */
    public function <>(): void {
      <>
    }<>
    ]],
    { i(1), i(2), i(0) }
  ),
}

return M
