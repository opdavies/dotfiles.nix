local map = vim.api.nvim_set_keymap

local options = {
  silent = true,
}

map("n", "<leader>tf", ":TestFile<CR>", options)
map("n", "<leader>tg", ":TestVisit<CR>", options)
map("n", "<leader>tl", ":TestLast<CR>", options)
map("n", "<leader>tn", ":TestNearest<CR>", options)
map("n", "<leader>ts", ":TestSuite<CR>", options)

vim.cmd [[
  let test#echo_command = 0
  let test#strategy = "neovim_sticky"

  let g:test#neovim_sticky#kill_previous = 1
  let g:test#neovim_sticky#reopen_window = 1
  let g:test#preserve_screen = 0

  let test#php#phpunit#executable = './run test'
  let test#php#phpunit#options = '--colors=always --testdox'
]]
