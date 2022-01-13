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
  tsserver = true,
  vuels = true,
  yamlls = true,

  intelephense = {
    filetypes = { "php", "module", "test", "inc" },
  },

  sumneko_lua = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        }
      }
    }
  },

  tailwindcss = {
    filetypes = { "html", "html.twig" },
  },
}

for server, config in pairs(servers) do
  require("opdavies.lsp.handlers").setup_server(server, config, lspconfig)
end

require "opdavies.lsp.null-ls"
