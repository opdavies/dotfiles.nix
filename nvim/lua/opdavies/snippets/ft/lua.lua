local ls = require "luasnip"

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local f, i = ls.function_node, ls.insert_node

return {
  pcall = fmt(
    [[
      local status_ok, {} = pcall(require, "{}")
      if not status_ok then
        return
      end
    ]],
    { i(1), rep(1) }
  ),

  req = fmt([[local {} = require "{}"]], {
    f(function(import_name)
      local parts = vim.split(import_name[1][1], ".", true)

      return parts[#parts] or ""
    end, { 1 }),
    i(1),
  }),
}
