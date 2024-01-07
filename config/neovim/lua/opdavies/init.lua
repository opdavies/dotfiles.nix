pcall("require", impatient)

require "opdavies.globals"

require("opdavies.options").setup()

require "opdavies.lsp"

require "opdavies.telescope.setup"
require "opdavies.telescope.mappings"

vim.api.nvim_create_user_command("GoToFile", function()
  require("opdavies.telescope").git_files()
end, {})
