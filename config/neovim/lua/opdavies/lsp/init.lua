local cmp = require('cmp')
local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset("recommended")

local on_attach = function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  local opts = { buffer = true }

  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
  vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
  vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
  vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
end

lsp.on_attach(on_attach)

lsp.set_preferences({
  sign_icons = {},
})

lsp.setup_servers({
  'ansiblels',
  'astro',
  'bashls',
  'cssls',
  'dockerls',
  'html',
  'jsonls',
  'nixd',
  'phpactor',
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

lspconfig.yamlls.setup({
  settings = {
    yaml = {
      keyOrdering = false,
    }
  }
})

vim.diagnostic.config({
  virtual_text = true,
})

cmp.setup({
  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },
})

require "opdavies.lsp.null-ls"
require "opdavies.lsp.signature"
