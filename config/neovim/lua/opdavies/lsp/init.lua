local cmp = require('cmp')
local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset("recommended")

local on_attach = function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  local opts = { buffer = true }

  vim.keymap.set("n", "<leader>ca", vim.lsp.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
end

lsp.on_attach(on_attach)

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

lsp.setup()

lspconfig.tailwindcss.setup({
  on_attach = on_attach,

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

vim.diagnostic.config({
  virtual_text = false,
})

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})

require "opdavies.lsp.null-ls"
require "opdavies.lsp.signature"
