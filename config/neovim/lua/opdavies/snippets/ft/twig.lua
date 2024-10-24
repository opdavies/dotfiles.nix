local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local i = ls.insert_node

local M = {
  stories = fmta(
    [[
    {% stories <name> with { title: '<title>' } %}

      <finish>

    {% endstories %}
    ]],
    { name = i(1), title = i(2), finish = i(0) }
  ),

  story = fmta(
    [[
    {% story <name> with {
      name: '<label>',
      args: {},
    } %}
      <finish>
    {% endstory %}
  ]],
    { name = i(1, "default"), label = i(2), finish = i(0) }
  ),
}

return M
