vim.opt.list = true
vim.opt.listchars = {
  eol = "↴",
}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555 gui=nocombine]]

require("indent_blankline").setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  show_end_of_line = true,
}
