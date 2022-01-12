local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("opdavies.lsp.handlers").setup()

local servers = {
  ansiblels = true,
  bashls = true,
  cssls = true,
  html = true,
  sumneko_lua = true,
  tsserver = true,
  vuels = true,
  yamlls = true,

  intelephense = {
    filetypes = { "php", "module", "test", "inc" },
  },

  tailwindcss = {
    filetypes = { "html", "html.twig" },
  },
}

for server, config in pairs(servers) do
  require("opdavies.lsp.handlers").setup_server(server, config, lspconfig)
end

require "opdavies.lsp.null-ls"
