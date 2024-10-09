local lint = require "lint"

lint.linters_by_ft = {
  dockerfile = { "hadolint" },
  javascript = { "eslint_d" },
  json = { "jsonlint" },
  lua = { "luacheck" },
  markdown = { "markdownlint" },
  nix = { "nix" },
  php = { "php", "phpcs", "phpstan" },
}
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})
