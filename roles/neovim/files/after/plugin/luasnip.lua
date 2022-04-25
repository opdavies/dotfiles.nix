if not pcall(require, "luasnip") then
  return
end

local api = vim.api
local fn = vim.fn

local ls = require "luasnip"

local snippet = ls.snippet
local t = ls.text_node

local shortcut = function(val)
  if type(val) == "string" then
    return { t { val }, i(0) }
  end

  if type(val) == "table" then
    for k, v in ipairs(val) do
      if type(v) == "string" then
        val[k] = t { v }
      end
    end
  end

  return val
end

local make = function(tbl)
  local result = {}
  for k, v in pairs(tbl) do
    table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
  end

  return result
end

local snippets = {}

for _, ft_path in ipairs(api.nvim_get_runtime_file("lua/opdavies/snippets/ft/*.lua", true)) do
  local ft = fn.fnamemodify(ft_path, ":t:r")
  snippets[ft] = make(loadfile(ft_path)())

  ls.add_snippets(ft, snippets[ft])
end

ls.add_snippets("js", snippets.javascript)
ls.add_snippets("typescript", snippets.javascript)
ls.add_snippets("vue", snippets.javascript)

ls.config.set_config {
  enable_autosnippets = true,
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

local imap = require("opdavies.keymap").imap
local map = require("opdavies.keymap").map
local nmap = require("opdavies.keymap").nmap

-- Expand the current item or just to the next item within the snippet.
map {
  { "i", "s" },
  "<c-k>",
  function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  { silent = true },
}

-- Jump backwards.
map {
  { "i", "s" },
  "<c-j>",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  { silent = true },
}

-- Select within a list of options.
imap {
  "<c-l>",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
}

nmap { "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>" }
