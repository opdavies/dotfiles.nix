local has_configs, configs = pcall(require, "nvim-treesitter.configs")
if not has_configs then
  return
end

configs.setup {
  autotag = {
    enable = true,
  },
  context_commenting = {
    enable = true,
  },
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

local nmap = require("opdavies.keymap").nmap

nmap { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>" }
nmap { "<leader>tp", "<cmd>TSPlaygroundToggle<CR>" }

local has_context, context = pcall(require, "treesitter-context")
if not has_context then
  return
end

context.setup { enable = true }
