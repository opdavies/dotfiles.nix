local lspconfig = require "lspconfig"
local nvim_status = require "lsp-status"

local handlers = require "opdavies.lsp.handlers"

require("neodev").setup {}

local servers = {
  bashls = true,

  cssls = {
    on_attach = function(client, bufnr)
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(handlers.on_publish_diagnostics, {})
    end,
  },

  gopls = true,
  html = true,

  intelephense = {
    filetypes = { "php", "module", "test", "inc" },
  },

  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },

        diagnostics = {
          globals = { "vim" },
        },

        runtime = {
          version = "LuaJIT",
        },

        telemetry = {
          enabled = false,
        },

        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },

  marksman = true,
  nil_ls = true,

  tailwindcss = {
    filetypes = { "html", "javascript", "twig", "typescript", "vue" },

    settings = {
      init_options = {
        userLanguages = {
          ["html.twig"] = "html",
        },
      },
    },
  },

  terraformls = true,
  tsserver = true,
  vuels = true,

  yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  },
}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

for server_name, config in pairs(servers) do
  if config == true then
    config = {}
  end

  config = vim.tbl_deep_extend("force", {}, {
    capabilities = capabilities,
  }, config)

  lspconfig[server_name].setup(config)
end

vim.diagnostic.config {
  float = { source = true },
  signs = true,
  underline = false,
  update_in_insert = false,
  virtual_text = { spacing = 2 },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function()
    local builtin = require "telescope.builtin"

    -- buf_inoremap { "<C-k>", vim.lsp.buf.signature_help }
    -- buf_nnoremap { "<leader>ca", vim.lsp.buf.code_action }
    -- buf_nnoremap { "<leader>d", vim.diagnostic.open_float }
    -- buf_nnoremap { "<leader>rn", vim.lsp.buf.rename }
    -- buf_nnoremap { "<leader>rr", "<cmd>LspRestart<cr>" }
    -- buf_nnoremap { "[d", vim.diagnostic.goto_prev }
    -- buf_nnoremap { "]d", vim.diagnostic.goto_next }

    -- buf_nnoremap { "gD", vim.lsp.buf.declaration }
    -- buf_nnoremap { "gd", handlers.definition }
    -- buf_nnoremap { "gi", vim.lsp.buf.implementation }
    -- buf_nnoremap { "gT", vim.lsp.buf.type_definition }

    vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
    vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
  end,
})
