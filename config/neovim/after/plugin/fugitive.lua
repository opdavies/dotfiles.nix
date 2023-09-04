vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",

  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git "push"
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git { "pull", "--rebase" }
    end, opts)
  end,
})
