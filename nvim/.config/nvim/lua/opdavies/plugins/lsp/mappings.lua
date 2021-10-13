local map_options = {
  noremap = true,
  silent = true,
}

vim.api.nvim_set_keymap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>dn', ':lua vim.lsp.diagnostic.goto_next()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>dp', ':lua vim.lsp.diagnostic.goto_prev()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>ds', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gr', ':lua vim.lsp.buf.references()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>', map_options)
vim.api.nvim_set_keymap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>', map_options)
