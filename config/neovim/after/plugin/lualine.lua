local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

lualine.setup {
  options = {
    component_separators = { left = "", right = "" },
    extensions = { "fzf", "quickfix" },
    icons_enabled = false,
    section_separators = { left = "", right = "" },
    theme = "catppuccin",
  },
  sections = {
    lualine_c = {
      "filename",
      "lsp_progress",
    },
  },
}
