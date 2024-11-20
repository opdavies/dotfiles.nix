local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup {
  flavour = "macchiato",
  integrations = {
    cmp = true,
    gitsigns = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    native_lsp = {
      enabled = true,
    },
    telescope = true,
    treesitter = true,
  },
  term_colors = true,
  transparent_background = true,
}

vim.cmd.colorscheme "catppuccin"
