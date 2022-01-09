local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  context_commenting = {
    enable = true,
  },
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  indent = {
    disable = { "yaml" },
    enable = true,
  },
}
