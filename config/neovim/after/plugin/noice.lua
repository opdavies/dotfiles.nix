local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

local notify = require 'notify'

noice.setup({
  cmdline = {
    format = {
      cmdline = { icon = ">" },
      filter = { icon = "$" },
      help = { icon = "?" },
      lua = { icon = "☾" },
      search_down = { icon = "🔍⌄" },
      search_up = { icon = "🔍⌃" },
    },
  },
  lsp = {
    override = {
      ["cmp.entry.get_documentation"] = true,
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
    },
  },
  popupmenu = {
    kind_icons = false,
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    inc_rename = false,
    long_message_to_split = true,
    lsp_doc_border = false,
  },
})

notify.setup({
    background_colour = "#1e222a",
    render = "minimal",
    stages = "static",
    timeout = 5000,
})

vim.cmd [[
    highlight NotifyERRORBorder guifg=#ED8796
    highlight NotifyWARNBorder guifg=#EED49F
    highlight NotifyINFOBorder guifg=#A6DA95
    highlight NotifyDEBUGBorder guifg=#B8C0E0
    highlight NotifyTRACEBorder guifg=#C6A0F6
    highlight NotifyERRORIcon guifg=#ED8796
    highlight NotifyWARNIcon guifg=#EED49F
    highlight NotifyINFOIcon guifg=#A6DA95
    highlight NotifyDEBUGIcon guifg=#B8C0E0
    highlight NotifyTRACEIcon guifg=#C6A0F6
    highlight NotifyERRORTitle guifg=#ED8796
    highlight NotifyWARNTitle guifg=#EED49F
    highlight NotifyINFOTitle guifg=#A6DA95
    highlight NotifyDEBUGTitle guifg=#B8C0E0
    highlight NotifyTRACETitle guifg=#C6A0F6
    highlight link NotifyERRORBody Normal
    highlight link NotifyWARNBody Normal
    highlight link NotifyINFOBody Normal
    highlight link NotifyDEBUGBody Normal
    highlight link NotifyTRACEBody Normal
]]
