vim.opt.list = true
vim.opt.listchars = {
  eol = "↴",
}

require("indent_blankline").setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  show_end_of_line = true,
}
