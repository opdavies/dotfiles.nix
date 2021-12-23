local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local function config(_config)
  return vim.tbl_deep_extend("force", {
      capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  }, _config or {})
end

lspconfig.ansiblels.setup(config())

lspconfig.bashls.setup(config())

lspconfig.cssls.setup(config())

lspconfig.html.setup(config())

lspconfig.intelephense.setup(config({
  filetypes = { "php", "test", "theme" }
}))

lspconfig.tsserver.setup(config())

lspconfig.vuels.setup(config())

lspconfig.yamlls.setup(config())

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)

local map = vim.api.nvim_set_keymap

local options = {
  noremap = true,
  silent = true,
}

map('n', '<leader>vb', ':lua require"telescope.builtin".buffers()<CR>', options)
map('n', '<leader>vca', ':lua vim.lsp.buf.code_action()<CR>', options)
map('n', '<leader>vd', ':lua vim.lsp.buf.definition()<CR>', options)
map('n', '<leader>vh', ':lua vim.lsp.buf.hover()<CR>', options)
map('n', '<leader>vi', ':lua vim.lsp.buf.implementation()<CR>', options)
map('n', '<leader>vn', ':lua vim.lsp.diagnostic.goto_next()<CR>', options)
map('n', '<leader>vrn', ':lua vim.lsp.buf.rename()<CR>', options)
map('n', '<leader>vrr', ':lua vim.lsp.buf.references()<CR>', options)
map('n', '<leader>vs', ':lua require"telescope.builtin".live_grep()<CR>', options)
map('n', '<leader>vsd', ':lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>', options)
map('n', '<leader>vsh', ':lua vim.lsp.buf.signature_help()<CR>', options)
