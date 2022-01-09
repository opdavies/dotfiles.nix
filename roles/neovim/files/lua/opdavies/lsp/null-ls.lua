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
    formatting.stylua,
    diagnostics.eslint,
    completion.spell,
  },
}
