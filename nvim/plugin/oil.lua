require("oil").setup {
  columns = { "icon" },

  keymaps = {
    ["<C-h>"] = false,
    ["<M-h>"] = "actions.select_split",
  },

  skip_confirm_for_simple_edits = true,

  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set("n", "-", "<Cmd>Oil<cr>", { desc = "Open parent directory" })
