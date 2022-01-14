local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local previewers = require "telescope.previewers"
local Job = require "plenary.job"

-- Create a new maker that won't preview binary files
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#dont-preview-binaries
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job
    :new({
      command = "file",
      args = { "--mime-type", "-b", filepath },
      on_exit = function(j)
        local mime_type = vim.split(j:result()[1], "/")[1]
        if mime_type == "text" then
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        else
          vim.schedule(function()
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
          end)
        end
      end,
    })
    :sync()
end

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
    prompt_prefix = "$ ",
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "fzf"
telescope.load_extension "refactoring"

local map = vim.api.nvim_set_keymap

local options = {
  noremap = true,
  silent = true,
}

local mappings = R "opdavies.telescope.mappings"

-- Builtin
map("n", "<leader>fb", '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
map("n", "<leader>fc", '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>', options)
map("n", "<leader>fd", '<CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', options)
map("n", "<leader>fe", '<CMD>lua R "opdavies.telescope.mappings".file_browser()<cr>', options)
map("n", "<leader>fg", '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
map("n", "<leader>fh", '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
map("n", "<leader>fl", '<CMD>lua require("telescope.builtin").live_grep({ sorting_strategy="ascending" })<CR>', options)
map("n", "<leader>fr", '<CMD>lua require("telescope.builtin").registers()<CR>', options)

-- Custom
map("n", "<Leader>en", '<CMD>lua R "opdavies.telescope.mappings".edit_neovim()<Cr>', options)
map("n", "<Leader>ff", '<CMD>lua R "opdavies.telescope.mappings".fd()<Cr>', options)
