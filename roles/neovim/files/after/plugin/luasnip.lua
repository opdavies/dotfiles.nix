local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

if vim.g.snippets ~= "luasnip" then
  return
end

ls.config.set_config {
  enable_autosnippets = true,
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

local snippet = ls.snippet
local i = ls.insert_node
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

local javascript = make(R "opdavies.snippets.ft.javascript")
local lua = make(R "opdavies.snippets.ft.lua")
local markdown = make(R "opdavies.snippets.ft.markdown")
local php = make(R "opdavies.snippets.ft.php")
local rst = make(R "opdavies.snippets.ft.rst")

ls.snippets = {
  js = javascript,
  lua = lua,
  markdown = markdown,
  php = php,
  rst = rst,
  typescript = javascript,
  vue = javascript,
}

local imap = require("opdavies.keymap").imap
local map = require("opdavies.keymap").map
local nmap = require("opdavies.keymap").nmap

local map_opts = { silent = true }

map {
  { "i", "s" },
  "<c-j>",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  map_opts,
}

map {
  { "i", "s" },
  "<c-k>",
  function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  map_opts,
}

imap {
  "<c-l>",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end,
  map_opts,
}

nmap { "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>", map_opts }
