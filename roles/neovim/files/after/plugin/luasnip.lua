local status_ok, luasnip = pcall(require, "luasnip")
if not status_ok then
  return
end

if vim.g.snippets ~= "luasnip" then
  return
end

-- Create a new snippet.
local s = luasnip.s

-- Different node types.
local c = luasnip.choice_node
local i = luasnip.insert_node
local t = luasnip.text_node

local snippets = {}

-- Snippets for both JavaScript and TypeScript.
local js_ts = {
  s(
    { trig = 'log', dscr = 'console.log' },
    { t('console.log('), i(1, 'value'), t(');') }
  ),
}

snippets.js = js_ts

snippets.markdown = {
  s(
    { trig = 'frontmatter', dscr = 'Document frontmatter' },
    { t({'---', 'tags: '}), i(1, 'value'), t({'', '---', ''}), i(0) }
  )
}

snippets.php = {
  s(
    { trig = 'test', dscr = 'Test block' },
    {
      t({ "/* @test **/", "" }),
      t("public function "),
      c(1, { t "test", t "it", t "should" }), -- The test method name prefix.
      i(2), -- The test method name.
      t({ "(): void {", "" }),
      t("  "), i(0), -- The method body.
      t({ "", "}" })
    }
  ),
}

snippets.typescript = js_ts
snippets.vue = js_ts

luasnip.snippets = snippets

vim.cmd [[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]
