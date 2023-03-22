local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
  return
end

gitsigns.setup {
  linehl = false,
  numhl = true,
}

vim.keymap.set('n', '[h', "<cmd>Gitsigns prev_hunk<cr>");
vim.keymap.set('n', ']h', "<cmd>Gitsigns next_hunk<cr>");
vim.keymap.set('n', 'gS', "<cmd>Gitsigns undo_stage_hunk<cr>");
vim.keymap.set('n', 'gb', "<cmd>Gitsigns blame_line<cr>");
vim.keymap.set('n', 'gp', "<cmd>Gitsigns preview_hunk<cr>");
vim.keymap.set('n', 'gs', "<cmd>Gitsigns stage_hunk<cr>");
