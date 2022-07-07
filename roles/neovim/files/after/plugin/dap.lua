local has_dap, dap = pcall(require, "dap")
if not has_dap then
  return
end

local has_dap_ui, dapui = pcall(require, "dapui")
if not has_dap_ui then
  return
end

dap.adapters.php = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. "/build/vscode-php-debug/out/phpDebug.js" }
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}"
    }
  }
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

require "dapui".setup {
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  }
}

require "nvim-dap-virtual-text".setup {
  commented = true,
}

local nmap = require "opdavies.keymap".nmap

nmap { "<F12>", ":lua require'dap'.step_over()<cr>" }
nmap { "<F2>", ":lua require'dap'.step_into()<cr>" }
nmap { "<F3>", ":lua require'dap'.step_over()<cr>" }
nmap { "<F5>", ":lua require'dap'.continue()<cr>" }
nmap { "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>" }
