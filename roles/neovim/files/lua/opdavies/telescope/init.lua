SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
  if SHOULD_RELOAD_TELESCOPE then
    RELOAD "plenary"
    RELOAD "telescope"
    RELOAD "opdavies.telescope.setup"
  end
end

local themes = require "telescope.themes"

local M = {}

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

function M.file_browser()
  local opts = { cwd = vim.fn.expand "%:p:h" }

  require("telescope").extensions.file_browser.file_browser(opts)
end

function M.fd()
  local opts = themes.get_ivy()

  require("telescope.builtin").find_files(opts)
end

function M.live_grep()
  require("telescope.builtin").live_grep {
    sorting_strategy = "ascending",
  }
end

return setmetatable({}, {
  __index = function(_, k)
    reloader()

    if M[k] then
      return M[k]
    else
      return require("telescope.builtin")[k]
    end
  end,
})
