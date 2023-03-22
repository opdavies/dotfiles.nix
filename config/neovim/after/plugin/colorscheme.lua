local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup {}

vim.opt.termguicolors = true

vim.g.catppuccin_flavour = "mocha"

vim.cmd([[ colorscheme catppuccin ]])
