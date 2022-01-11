local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local completion = null_ls.builtins.completion
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    formatting.prettier,
    formatting.rustywind,
    formatting.stylua,

    diagnostics.eslint,
    diagnostics.php,
    diagnostics.phpcs,
    diagnostics.phpstan,

    completion.spell,
  },

  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd [[
        augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
      ]]
    end
  end,
}
