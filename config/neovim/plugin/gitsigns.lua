local gitsigns = require "gitsigns"

gitsigns.setup {
  linehl = false,
  numhl = true,
}

local set = vim.keymap.set

set("n", "[h", "<cmd>Gitsigns prev_hunk<CR>")
set("n", "]h", "<cmd>Gitsigns next_hunk<CR>")

set("n", "<leader>hR", gitsigns.reset_buffer)
set("n", "<leader>hS", gitsigns.stage_buffer)
set("n", "<leader>hb", gitsigns.blame_line)
set("n", "<leader>hp", gitsigns.preview_hunk)
set("n", "<leader>hr", gitsigns.reset_hunk)
set("n", "<leader>hs", gitsigns.stage_hunk)
set("n", "<leader>hu", gitsigns.undo_stage_hunk)

set("v", "<leader>hr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end)

set("v", "<leader>hs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end)

-- Text object.
set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
