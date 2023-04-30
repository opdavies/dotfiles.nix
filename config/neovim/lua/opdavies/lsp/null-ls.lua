local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.phpcbf,
    code_actions.gitsigns,

    formatting.black,
    formatting.markdownlint,
    formatting.prettier,
    formatting.rustywind,
    formatting.stylua,

    diagnostics.eslint.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    diagnostics.markdownlint,
    diagnostics.php,
    diagnostics.phpcs,
    diagnostics.phpstan,
    diagnostics.shellcheck,
  },

  temp_dir = "/tmp",
}
