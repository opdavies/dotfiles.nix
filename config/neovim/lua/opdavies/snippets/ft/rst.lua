local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local i = ls.insert_node
local f = ls.function_node

local fill_line = function(char)
  return function()
    local row = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_get_lines(0, row - 2, row, false)
    return string.rep(char, #lines[1])
  end
end

local M = {
  class = { ".. class:: ", i(1) },
  footer = { ".. footer:: ", i(1) },
  link = { ".. _", i(1), ":" },
  raw = { ".. raw:: ", i(1) },

  -- TODO: add an optional new line and ":width" property.
  image = { ".. image:: ", i(1) },

  head = f(fill_line "=", {}),
  sub = f(fill_line "-", {}),
  subsub = f(fill_line "^", {}),

  -- Add a page break with an optional page template.
  pb = fmta(
    [[
    .. raw:: pdf

       PageBreak<>
    ]],
    { i(0) }
  ),

  -- Add a new speaker note.
  ta = fmta(
    [[
    .. raw:: pdf

       TextAnnotation "<>"
    ]],
    { i(0) }
  )
}

return M
