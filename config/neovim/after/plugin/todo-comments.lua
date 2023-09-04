local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
  return
end

todo_comments.setup {}

local nmap = require("opdavies.keymap").nmap

nmap {
  "[t",
  function()
    todo_comments.jump_prev()
  end,
  { desc = "Previous todo comment" },
}
nmap {
  "]t",
  function()
    todo_comments.jump_next()
  end,
  { desc = "Next todo comment" },
}

nmap { "<leader>tt", "<cmd>TodoTelescope<cr>" }
nmap { "<leader>tq", "<cmd>TodoQuickFix<cr>" }
