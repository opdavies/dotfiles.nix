local status_ok, ls = pcall(require, "luasnip")
if not status_ok then
  return
end

if vim.g.snippets ~= "luasnip" then
  return
end

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

local function make(tbl)
  local result = {}
  for k, v in pairs(tbl) do
    table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
  end

  return result
end

local javascript = make(R "opdavies.snippets.ft.javascript")
local markdown = make(R "opdavies.snippets.ft.markdown")
local php = make(R "opdavies.snippets.ft.php")
local rst = make(R "opdavies.snippets.ft.rst")

local snippets = {
  js = javascript,
  markdown = markdown,
  php = php,
  rst = rst,
  typescript = javascript,
  vue = javascript,
}

ls.snippets = snippets

vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
