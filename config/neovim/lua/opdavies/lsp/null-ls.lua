local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup {
  sources = {
    code_actions.gitsigns,

    formatting.black,
    formatting.markdownlint,
    formatting.phpcbf.with({
      command = "./vendor/bin/phpcbf",
      condition = function(utils)
        return utils.root_has_file({ 'phpcs.xml.dist' })
      end,
    }),
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
    diagnostics.phpcs.with({
      command = "./vendor/bin/phpcs",
      condition = function(utils)
        return utils.root_has_file({ 'phpcs.xml.dist' })
      end,
    }),
    diagnostics.phpstan,
    diagnostics.shellcheck,
  },

  temp_dir = "/tmp",
}
