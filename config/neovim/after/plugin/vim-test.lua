local map = vim.api.nvim_set_keymap

local options = {
  silent = true,
}

map("n", "<leader>tf", ":TestFile<CR>", options)
map("n", "<leader>tg", ":TestVisit<CR>", options)
map("n", "<leader>tl", ":TestLast<CR>", options)
map("n", "<leader>tn", ":TestNearest<CR>", options)
map("n", "<leader>ts", ":TestSuite<CR>", options)

vim.cmd([[
  let test#echo_command = 0
  let test#neovim#start_normal = 1
  let test#strategy = "floaterm"

  let test#php#phpunit#executable = 'just test'
  let test#php#phpunit#options = '--colors=always --testdox'
]])
