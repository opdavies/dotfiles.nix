local M = {}

local themes = require "telescope.themes"

function M.edit_neovim()
  local opts = {
    cwd = "~/.config/nvim",
    find_command = { "rg", "--no-ignore", "--files", "--follow" },
    path_display = { "shorten" },
    prompt_title = "~ dotfiles ~",

    layout_strategy = "flex",
    layout_config = {
      height = 0.8,
      prompt_position = "top",
      width = 0.9,

      horizontal = {
        width = { padding = 0.15 },
      },
      vertical = {
        preview_height = 0.75,
      },
    },
  }

  require("telescope.builtin").find_files(opts)
end

function M.fd()
  local opts = themes.get_ivy()

  require("telescope.builtin").find_files(opts)
end

return M
