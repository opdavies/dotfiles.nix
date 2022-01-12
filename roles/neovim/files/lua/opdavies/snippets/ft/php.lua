local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local c = ls.choice_node
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local M = {
  -- TODO: only load if within a Drupal project?
  drupalclass = {
    fmta(
      [[
      <<?php

      declare(strict_types=1);

      namespace Drupal\<>;

      <>class <> {

        <>

      }
      ]],
      { i(1), c(2, { t "", t "final " }), i(3), i(0) }
    ),
  },

  test = {
    fmta(
      [[
        /** @test */
        public function <><>(): void {
          <>
        }
      ]],
      {
        c(1, {
          t "test",
          t "it",
          t "should",
        }),
        i(2),
        i(0),
      }
    ),
  },
}

return M
