local status_ok, zen_mode = pcall(require, "zen-mode")
if not status_ok then
  return
end

zen_mode.setup {
  window = {
    backdrop = 0.95,
    height = 1,
    width = 80,
    options = {
      relativenumber = false,
      number = false,
      signcolumn = "no",
    },
  },
  plugins = {
    options = {
      enabled = true,
      ruler = false,
    },
    gitsigns = { enabled = true },
    tmux = { enabled = true },
  },
}
