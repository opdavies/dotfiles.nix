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
  extensions = {
    file_browser = {
      theme = "ivy",
    },
  },
}

telescope.load_extension "file_browser"
telescope.load_extension "fzf"
telescope.load_extension "refactoring"

-- local map = vim.api.nvim_set_keymap
--
-- local options = {
--   noremap = true,
--   silent = true,
-- }
--
-- local nmap = require "opdavies.keymap".nmap
-- local tele_mappings = R "opdavies.telescope.mappings"
--
-- -- Builtin
-- nmap({ "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', opts })
-- nmap({ "<leader>fc", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>', opts })
-- nmap({ "<leader>fd", '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', opts })
-- nmap({ "<leader>fg", '<cmd>lua require("telescope.builtin").git_files{}<cr>', opts })
-- nmap({ "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts })
-- nmap({ "<leader>fl", '<cmd>lua require("telescope.builtin").live_grep({ sorting_strategy="ascending" })<cr>', opts })
-- nmap({ "<leader>fr", '<cmd>lua require("telescope.builtin").registers()<cr>', opts })
--
-- -- Custom
-- nmap({ "<leader>fe", tele_mappings.file_browser, opts })
-- nmap({ "<Leader>en", tele_mappings.edit_neovim, opts })
-- nmap({ "<Leader>ff", tele_mappings.fd, opts })
