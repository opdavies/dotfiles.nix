local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true
vim.opt.listchars = {
  eol = "↴",
}

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#555555 gui=nocombine]]

indent_blankline.setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
  },
  show_end_of_line = true,
}
