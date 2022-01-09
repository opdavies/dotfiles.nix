local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local opts = {
  on_attach = require("opdavies.lsp.handlers").on_attach,
  capabilities = require("opdavies.lsp.handlers").capabilities,
}

local servers = {
  "ansiblels",
  "bashls",
  "cssls",
  "html",
  "tsserver",
  "vuels",
  "yamlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(opts)
end

local intelephense_opts = require "opdavies.lsp.settings.intelephense"
lspconfig.intelephense.setup {
  vim.tbl_deep_extend("force", intelephense_opts, opts),
}

local sumneko_lua_opts = require "opdavies.lsp.settings.sumneko_lua"
lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", sumneko_lua_opts, opts))

local tailwindcss_opts = require "opdavies.lsp.settings.tailwindcss"
lspconfig.tailwindcss.setup {
  vim.tbl_deep_extend("force", tailwindcss_opts, opts),
}

require("opdavies.lsp.handlers").setup()

require "opdavies.lsp.null-ls"
