vim.g.mapleader = " "
vim.g.snippets = "luasnip"

local settings = {
  autoindent = true,
  backup = false,
  breakindent = true,
  expandtab = true,
  foldlevel = 1,
  foldlevelstart = 99,
  foldmethod = "indent",
  formatoptions = "clqjp",
  hidden = false,
  hlsearch = false,
  inccommand = "split",
  laststatus = 3,
  linebreak = true,
  list = true,
  mouse = "",
  number = true,
  pumblend = 10,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 5,
  shiftwidth = 2,
  showmode = false,
  signcolumn = "yes:1",
  smartindent = true,
  softtabstop = 2,
  spellfile = "/home/opdavies/Code/dotfiles/nvim/spell/en.utf-8.add",
  splitbelow = true,
  splitright = true,
  swapfile = false,
  syntax = "on",
  tabstop = 2,
  termguicolors = true,
  textwidth = 0,
  undodir = os.getenv "HOME" .. "/.vim/undodir",
  undofile = true,
  updatetime = 1000,
  wrap = false,
}

for key, value in pairs(settings) do
  vim.o[key] = value
end

vim.opt.backupdir:remove "." -- keep backups out of the current directory
vim.opt.clipboard:append "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noinsert", "noselect" }
vim.opt.listchars:append {
  trail = "·",
}
