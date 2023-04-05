local has_configs, configs = pcall(require, "nvim-treesitter.configs")
if not has_configs then
  return
end


local parser_install_dir = vim.fn.stdpath('cache') .. "treesitters";

configs.setup {
  autotag = {
    enable = true,
  },
  context_commenting = {
    enable = true,
  },
  ensure_installed = {
    "astro",
    "bash",
    "comment",
    "css",
    "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "make",
    "markdown",
    "php",
    "phpdoc",
    "regex",
    "rst",
    "scss",
    "typescript",
    "vim",
    "vue",
    "yaml",
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
  parser_install_dir = parser_install_dir,
}

vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

local nmap = require("opdavies.keymap").nmap

nmap { "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>" }
nmap { "<leader>tp", "<cmd>TSPlaygroundToggle<CR>" }

local has_context, context = pcall(require, "treesitter-context")
if not has_context then
  return
end

context.setup { enable = true }
