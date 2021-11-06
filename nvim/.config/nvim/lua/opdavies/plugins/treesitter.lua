local function init()
  require "nvim-treesitter.configs".setup {
    context_commenting = {
      enable = true
    },
    ensure_installed = "maintained",
    highlight = {
      enable = true,
    }
  }
end

return {
  init = init
}
