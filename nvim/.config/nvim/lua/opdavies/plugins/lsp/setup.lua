--local has_lsp, lspconfig = pcall(require, "lspconfig")

local function config(_config)
  return vim.tbl_deep_extend("force", {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }, _config or {})
end

require'lspconfig'.ansiblels.setup(config())

require'lspconfig'.bashls.setup(config())

require'lspconfig'.cssls.setup(config())

require'lspconfig'.html.setup(config())

require'lspconfig'.intelephense.setup(config({
  filetypes = { "php", "test", "theme" }
}))

require'lspconfig'.tsserver.setup(config({
  filetypes = { "javascript", "typescript", "vue" }
}))

require'lspconfig'.yamlls.setup(config())

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
