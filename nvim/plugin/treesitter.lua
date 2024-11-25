local configs = require "nvim-treesitter.configs"
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

configs.setup {
  autotag = {
    enable = true,
  },

  context_commenting = {
    enable = true,
  },

  highlight = {
    enable = true,
  },

  indent = {
    disable = { "yaml" },
    enable = true,
  },

  matchup = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
        ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
        ["l="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
        ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

        ["a:"] = { query = "@property.outer", desc = "Select outer part of an object property" },
        ["i:"] = { query = "@property.inner", desc = "Select inner part of an object property" },
        ["l:"] = { query = "@property.lhs", desc = "Select left part of an object property" },
        ["r:"] = { query = "@property.rhs", desc = "Select right part of an object property" },

        ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
        ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

        ["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

        ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
        ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

        ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
        ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

        ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
        ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

        ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
        ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },
      },
    },
  },

  swap = {
    enable = true,

    swap_next = {
      ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
      ["<leader>n:"] = "@property.outer", -- swap object property with next
      ["<leader>nm"] = "@function.outer", -- swap function with next
    },

    swap_previous = {
      ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
      ["<leader>p:"] = "@property.outer", -- swap object property with prev
      ["<leader>pm"] = "@function.outer", -- swap function with previous
    },
  },

  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist

    goto_next_start = {
      ["]f"] = { query = "@call.outer", desc = "Next function call start" },
      ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
      ["]c"] = { query = "@class.outer", desc = "Next class start" },
      ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
      ["]l"] = { query = "@loop.outer", desc = "Next loop start" },

      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    },

    goto_next_end = {
      ["]F"] = { query = "@call.outer", desc = "Next function call end" },
      ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
      ["]C"] = { query = "@class.outer", desc = "Next class end" },
      ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
      ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
    },

    goto_previous_start = {
      ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
      ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
      ["[c"] = { query = "@class.outer", desc = "Prev class start" },
      ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
      ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
    },

    goto_previous_end = {
      ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
      ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
      ["[C"] = { query = "@class.outer", desc = "Prev class end" },
      ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
      ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
    },
  },
}

local set = vim.keymap.set

set("n", "<leader>th", "<cmd>TSHighlightCapturesUnderCursor<CR>")
set("n", "<leader>tp", "<cmd>TSPlaygroundToggle<CR>")

-- vim way: ; goes to the direction you were moving.
set({ "n", "o", "x" }, ";", ts_repeat_move.repeat_last_move)
set({ "n", "o", "x" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
set({ "n", "o", "x" }, "f", ts_repeat_move.builtin_f)
set({ "n", "o", "x" }, "F", ts_repeat_move.builtin_F)
set({ "n", "o", "x" }, "t", ts_repeat_move.builtin_t)
set({ "n", "o", "x" }, "T", ts_repeat_move.builtin_T)
