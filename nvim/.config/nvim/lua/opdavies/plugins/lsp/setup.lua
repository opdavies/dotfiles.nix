local has_lsp, lspconfig = pcall(require, "lspconfig")

local servers = {
  ansiblels = true,
  bashls = true,
  cssls = true,
  html = true,

  intelephense = {
    filetypes = { "install", "inc", "module", "php", "test", "theme" }
  },

  tsserver = {
    filetypes = { "js", "jsx", "typescript", "vue" }
  },

  yamlls = true,
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = false,
    signs = true,
    update_in_insert = true,
  }
)
