local cmp_nvim_lsp = require "cmp_nvim_lsp"
local handlers = require "opdavies.lsp.handlers"
local lspconfig = require "lspconfig"

require("neodev").setup {}

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.bashls.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = function(_, _)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(handlers.on_publish_diagnostics, {})
  end,
}

lspconfig.gopls.setup {
  capabilities = capabilities,
}

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.intelephense.setup {
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
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
}

lspconfig.marksman.setup {
  capabilities = capabilities,
}

lspconfig.nixd.setup {
  capabilities = capabilities,
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = "nix fmt",
      },
    },
  },
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  filetypes = { "html", "javascript", "twig", "typescript", "vue" },
  settings = {
    init_options = {
      userLanguages = {
        ["html.twig"] = "html",
      },
    },
  },
}

lspconfig.terraformls.setup {
  capabilities = capabilities,
}

lspconfig.ts_ls.setup {
  capabilities = capabilities,
}

lspconfig.vuels.setup {
  capabilities = capabilities,
}

lspconfig.yamlls.setup {
  capabilities = capabilities,
  settings = {
    yaml = {
      keyOrdering = false,
    },
  },
}

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

    vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = 0 })
    vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = 0 })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = 0 })
    vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })

    vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, { buffer = 0 })
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { buffer = 0 })
  end,
})
