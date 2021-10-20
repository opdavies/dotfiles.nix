local map_options = {
  noremap = true,
  silent = true,
}

vim.api.nvim_set_keymap('n', '<leader>vb', ':lua require"telescope.builtin".buffers()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vca', ':lua vim.lsp.buf.code_action()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vd', ':lua vim.lsp.buf.definition()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vh', ':lua vim.lsp.buf.hover()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vi', ':lua vim.lsp.buf.implementation()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vn', ':lua vim.lsp.diagnostic.goto_next()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vrn', ':lua vim.lsp.buf.rename()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vrr', ':lua vim.lsp.buf.references()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vs', ':lua require"telescope.builtin".live_grep()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vsd', ':lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>', map_options)
vim.api.nvim_set_keymap('n', '<leader>vsh', ':lua vim.lsp.buf.signature_help()<CR>', map_options)
