local cmp = require "cmp"

cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
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
}
