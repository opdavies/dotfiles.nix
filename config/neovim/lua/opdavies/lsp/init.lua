local lsp = require 'lsp-zero'
local lspconfig = require "lspconfig"

lsp.preset({
  float_border = 'none',
});

lsp.nvim_workspace()

lsp.setup_servers({
  'ansiblels',
  'astro',
  'bashls',
  'cssls',
  'dockerls',
  'html',
  'intelephense',
  'jsonls',
  'tailwindcss',
  'terraformls',
  'tsserver',
  'volar',
  'vuels',
  'yamlls'
})

lsp.set_preferences({
  sign_icons = {
      error = 'E',
      hint = 'H',
      info = 'I',
      warn = 'W',
  },

  suggest_lsp_servers = false,
})

lsp.on_attach(on_attach)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

lspconfig.intelephense.setup({
  filetypes = { "php", "module", "test", "inc" },
})

lspconfig.tailwindcss.setup({
  filetypes = {
    "astro",
    "html",
    "html.twig",
    "javascript",
    "php",
    "twig",
    "typescript",
    "vue",
  },

  init_options = {
    userLanguages = {
      ["html.twig"] = "html",
    },
  },
})

require "opdavies.lsp.null-ls"
require "opdavies.lsp.signature"
