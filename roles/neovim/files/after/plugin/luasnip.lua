local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

if vim.g.snippets ~= "luasnip" then
  return
end

local javascript = require "opdavies.snippets.ft.javascript"
local markdown = require "opdavies.snippets.ft.markdown"
local php = require "opdavies.snippets.ft.php"

local snippets = {
  js = javascript,
  all = markdown,
  php = php,
  typescript = javascript,
  vue = javascript,
}

luasnip.snippets = snippets

vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
