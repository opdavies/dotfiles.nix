local gitsigns_status_ok, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status_ok then
  return
end

gitsigns.setup {
  linehl = false,
  numhl = true,
}

local actions = require("gitsigns.actions")

vim.keymap.set('n', '[h', actions.prev_hunk);
vim.keymap.set('n', ']h', actions.next_hunk);
vim.keymap.set('n', 'gS', actions.undo_stage_hunk);
vim.keymap.set('n', 'gb', actions.blame_line);
vim.keymap.set('n', 'gp', actions.preview_hunk);
vim.keymap.set('n', 'gs', actions.stage_hunk);
