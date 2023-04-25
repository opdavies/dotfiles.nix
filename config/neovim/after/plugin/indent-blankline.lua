local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.list = true

vim.api.nvim_set_hl(0, 'IndentBlankLineChar', { fg = "#2F313C" })

indent_blankline.setup {
  show_end_of_line = true,
}

