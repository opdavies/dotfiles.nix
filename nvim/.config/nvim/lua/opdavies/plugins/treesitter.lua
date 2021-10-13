local configs = require'nvim-treesitter.configs'

configs.setup {
  context_commenting = {
    enable = true
  },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  }
}
