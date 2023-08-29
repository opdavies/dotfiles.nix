local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local noice = require 'noice'

lualine.setup {
  options = {
    component_separators = { left = '', right = '' },
    extensions = { "fzf", "quickfix" },
    icons_enabled = false,
    section_separators = { left = '', right = '' },
    theme = "catppuccin"
  },

  sections = {
    lualine_x = {
      {
        noice.api.status.message.get_hl,
        cond = noice.api.status.message.has,
      },
      {
        noice.api.status.command.get,
        cond = noice.api.status.command.has,
        color = { fg = "#EED49F" },
      },
      {
        noice.api.status.mode.get,
        cond = noice.api.status.mode.has,
        color = { fg = "#EED49F" },
      },
      {
        noice.api.status.search.get,
        cond = noice.api.status.search.has,
        color = { fg = "#EED49F" },
      },
    },
  },
}
