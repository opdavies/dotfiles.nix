local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.close(),
    ["<c-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
  },

  sources = {
    { name = "buffer", priority = 2, keyword_length = 5, max_item_count = 5 },
    { name = "calc" },
    { name = "path" },
    { name = "spell" },
    { name = "treesitter" },

    -- Neovim
    { name = "nvim_lsp", priority = 10 },
    { name = "nvim_lua" },

    -- Plugins
    { name = "luasnip" },
    { name = "cmp_tabnine" },
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
  },
}
