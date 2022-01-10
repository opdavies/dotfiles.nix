local M = {}

M.setup = function()
  local config = {
    virtual_text = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)
end

local function lsp_keymaps(bufnr)
  local function map(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }

  map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  map("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  map("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  map("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

custom_attach = function(client, bufnr)
  print(client.name, bufnr)

  lsp_keymaps(bufnr)
end

local custom_init = function(client)
  client.config.flags = client.config.flags or {}
  client.config.flags.allow_incremental_sync = true
end

M.setup_server = function(server, config, lspconfig)
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
      debounce_text_changes = 50,
    },
  }, config)

  lspconfig[server].setup(config)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()
updated_capabilities = cmp_nvim_lsp.update_capabilities(updated_capabilities)

M.capabilities = updated_capabilities

return M
