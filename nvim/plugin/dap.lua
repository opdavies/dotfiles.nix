local dap = require "dap"
local ui = require "dapui"

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv "HOME" .. "/build/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    pathMappings = {
      ["/app"] = "${workspaceFolder}",
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}

dap.listeners.after.event_initialized["ui_config"] = function()
  ui.open()
end

dap.listeners.before.event_terminated["ui_config"] = function()
  ui.close()
end

dap.listeners.before.event_exited["ui_config"] = function()
  ui.close()
end

ui.setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
}

require("nvim-dap-virtual-text").setup {
  commented = true,
}

vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>gb", dap.run_to_cursor)

vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
