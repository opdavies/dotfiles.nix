local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

local nvim_status = require "lsp-status"

local imap = require("opdavies.keymap").imap
local nmap = require("opdavies.keymap").nmap

local telescope_mapper = require "opdavies.telescope.mappings"

local buf_nnoremap = function(opts)
  opts.buffer = 0
  nmap(opts)
end

local buf_inoremap = function(opts)
  opts.buffer = 0
  imap(opts)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

local custom_attach = function(client)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  nvim_status.on_attach(client)

  -- Keymaps
  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

  buf_nnoremap { "<leader>ca", vim.lsp.buf.code_action }
  buf_nnoremap { "<leader>dn", vim.diagnostic.goto_next }
  buf_nnoremap { "<leader>dp", vim.diagnostic.goto_prev }
  buf_nnoremap { "<leader>f", vim.lsp.buf.format }
  buf_nnoremap { "<leader>rn", vim.lsp.buf.rename }
  buf_nnoremap { "<leader>rr", "<cmd>LspRestart<cr>" }
  buf_nnoremap { "K", vim.lsp.buf.hover }
  buf_nnoremap { "gD", vim.lsp.buf.declaration }
  buf_nnoremap { "gT", vim.lsp.buf.type_definition }
  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "gi", vim.lsp.buf.implementation }

  if filetype ~= "lua" then
    buf_nnoremap { "K", vim.lsp.buf.hover }
  end

  telescope_mapper("<leader>dl", "diagnostics", nil, true)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  -- Attach any filetype specific options to the client
  -- filetype_attach[filetype](client)
end

local servers = {
  ansiblels = true,
  bashls = true,
  cssls = true,
  gopls = true,
  html = true,
  -- intelephense = true
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
        },
      },
    },
  },

  tailwindcss = {
    filetypes = {
      -- html
      "html",
      "html.twig",
      "php",
      "twig",

      -- js
      "javascript",
      "typescript",

      -- mixed
      "vue",
    },

    init_options = {
      userLanguages = {
        ["html.twig"] = "html",
      },
    },
  },

  -- tsserver = {
  --   filetypes = {
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --     "vue",
  --   },
  -- },
}

local setup_server = function(server, config)
  if not config then
    return
  end

  if type(config) ~= "table" then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {
    on_init = custom_init,
    on_attach = custom_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = nil,
    },
  }, config)

  lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
  setup_server(server, config)
end

vim.diagnostic.config {
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = { spacing = 2 },
}

require "opdavies.lsp.null-ls"
require "opdavies.lsp.signature"
