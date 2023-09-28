require("lualine").setup {
  options = {
    component_separators = { left = "", right = "" },
    extensions = { "fzf", "quickfix" },
    icons_enabled = false,
    section_separators = { left = "", right = "" },
    theme = "catppuccin",
  },

  sections = {
    lualine_c = {
      "lsp_progress",
    },
  },
}
