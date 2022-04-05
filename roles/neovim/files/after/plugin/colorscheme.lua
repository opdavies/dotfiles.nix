if not pcall(require, "colorbuddy") then
  return
end

vim.opt.termguicolors = true

require "colorbuddy".colorscheme "gruvbuddy"
require "colorizer".setup {}

local Group = require("colorbuddy.group").Group
local c = require("colorbuddy.color").colors
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

-- Global
-- Group.new("TSComment", c.none)
Group.new("TSInclude", nil)
Group.new("TSOperator", nil)
Group.new("TSPunctBracket", nil)
Group.new("TSPunctDelimiter", nil)
Group.new("WinSeparator", nil)

-- Lua
Group.new("luaTSConstant", c.blue)
Group.new("luaTSField", nil, nil)
Group.new("luaTSFuncBuiltin", nil)
Group.new("luaTSFunction", nil)
Group.new("luaTSKeyword", nil)
Group.new("luaTSKeywordFunction", c.violet)
Group.new("luaTSKeywordOperator", c.orange)
Group.new("luaTSKeywordReturn", nil)
Group.new("luaTSParameter", nil)
Group.new("luaTSPunctBracket", nil)
Group.new("luaTSString", c.blue)
Group.new("luaTSVariable", nil)

-- PHP
Group.new("phpTSInclude", nil)
Group.new("phpTSKeyword", nil)
Group.new("phpTSKeywordFunction", nil)
Group.new("phpTSMethod", c.blue)
Group.new("phpTSOperator", nil)
Group.new("phpTSVariableBuiltin", nil)
Group.new("phpTSNamespace", c.blue)

-- JavaScript
Group.new("javascriptTSConstructor", c.blue)
Group.new("javascriptTSException", c.red)
Group.new("javascriptTSFunction", c.none)
Group.new("javascriptTSMethod", nil)
Group.new("javascriptTSProperty", nil)
Group.new("javascriptTSVariable", c.blue)

-- TypeScript
Group.new("typescriptTSConditional", c.none)
Group.new("typescriptTSKeyword", c.none)
Group.new("typescriptTSProperty", c.violet)
Group.new("typescriptTSType", c.blue)
