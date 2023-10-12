local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node

local M = {
  vimplugin = fmta(
    [[
    {
      plugin = <>.<>;
      type = "lua";
      config = ''
        <>
      '';
    }<>
    ]],
    { c(1, { t "vimPlugin", t "customVim" }), i(2), i(3), i(0) }
  ),
}

return M
