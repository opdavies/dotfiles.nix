local status_ok, el = pcall(require, "el")
if not status_ok then
  return
end

local builtin = require "el.builtin"
local diagnostic = require "el.diagnostic"
local extensions = require "el.extensions"
local lsp_statusline = require "el.plugins.lsp_status"
local sections = require "el.sections"
local subscribe = require "el.subscribe"

local file_icon = subscribe.buf_autocmd("el_file_icon", "BufRead", function(_, buffer)
  return extensions.file_icon(_, buffer)
end)

local git_branch = subscribe.buf_autocmd("el_git_branch", "BufEnter", function(window, buffer)
  local branch = extensions.git_branch(window, buffer)
  if branch then
    return " " .. extensions.git_icon() .. " " .. branch
  end
end)

local git_changes = subscribe.buf_autocmd("el_git_changes", "BufWritePost", function(window, buffer)
  return extensions.git_changes(window, buffer)
end)

local show_current_func = function(window, buffer)
  if buffer.filetype == "lua" then
    return ""
  end

  return lsp_statusline.current_function(window, buffer)
end

local diagnostic_display = diagnostic.make_buffer()

el.setup {
  generator = function(window, buffer)
    local mode = extensions.gen_mode { format_string = " %s " }

    local items = {
      { mode },
      { git_branch },
      { sections.split },
      { file_icon },
      { " " },
      { sections.maximum_width(builtin.make_responsive_file(140, 90), 0.40) },
      { sections.collapse_builtin { { " " }, { builtin.modified_flag } } },
      { sections.split },
      { diagnostic_display },
      { show_current_func },
      { git_changes },
      { "[" },
      { builtin.line_with_width(3) },
      { ":" },
      { builtin.column_with_width(2) },
      { "]" },
      {
        sections.collapse_builtin {
          "[",
          builtin.help_list,
          builtin.readonly_list,
          "]",
        },
      },
      { builtin.filetype },
    }

    local add_item = function(result, item)
      table.insert(result, item)
    end

    local result = {}
    for _, item in ipairs(items) do
      add_item(result, item)
    end

    return result
  end,
}
