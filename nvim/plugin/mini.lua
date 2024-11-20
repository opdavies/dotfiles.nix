require("mini.ai").setup { n_lines = 500 }

require("mini.align").setup {}

require("mini.bracketed").setup {}

require("mini.hipatterns").setup {
  highlighters = {
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
  },
}

require("mini.move").setup {}

require("mini.operators").setup {}

require("mini.statusline").setup {
  set_vim_settings = false,
  use_icons = false,
}

require("mini.surround").setup {}
