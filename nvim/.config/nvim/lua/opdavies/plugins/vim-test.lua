local function init()
  local map = vim.api.nvim_set_keymap

  local options = {
    silent = true
  }

  map('n', 't<C-f>', ':TestFile<CR>', options)
  map('n', 't<C-g>', ':TestVisit<CR>', options)
  map('n', 't<C-l>', ':TestLast<CR>', options)
  map('n', 't<C-n>', ':TestNearest<CR>', options)
  map('n', 't<C-s>', ':TestSuite<CR>', options)

  vim.g['test#strategy'] = "neovim"
end

return {
  init = init
}
