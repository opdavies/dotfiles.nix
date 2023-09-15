local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

vim.opt.shortmess:append "c"

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<tab>"] = cmp.config.disable,
  },

  sources = {
    { name = "nvim_lsp_signature_help" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "cmp_tabnine" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer", keyword_length = 5, max_item_count = 5 },
  },

  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },

  formatting = {
    format = require("lspkind").cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        cmp_tabnine = "[tn]",
        luasnip = "[snip]",
        nvim_lsp = "[lsp]",
        nvim_lua = "[lua]",
        path = "[path]",
      },
    },
  },

  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

vim.cmd [[
  augroup DadbodSql
    au!
    autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
  augroup END
]]
