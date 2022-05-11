local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  context_commenting = {
    enable = true,
  },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    disable = { "yaml" },
    enable = true,
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

local nmap = require "opdavies.keymap".nmap

nmap({ "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>" })
nmap({ "<leader>tp", "<cmd>TSPlaygroundToggle<CR>" })
