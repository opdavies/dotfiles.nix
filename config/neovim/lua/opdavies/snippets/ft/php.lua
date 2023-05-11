local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"

local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local t = ls.text_node

local M = {

  drupalclass = fmta(
    [[
    <<?php

    declare(strict_types=1);

    namespace <>;

    final class <> {

      <>

    }]],
    {
      f(function()
        local filepath = vim.fn.expand "%:h"
        local filepath_parts = vim.fn.split(filepath, "/")

        if not vim.tbl_contains(filepath_parts, "src") then
          return ""
        end

        local namespace_parts = { "Drupal" }

        local is_test_file = vim.tbl_contains(filepath_parts, "tests")
        if is_test_file then
          table.insert(namespace_parts, "Tests")
        end

        -- Find and add the module name.
        for k, v in ipairs(filepath_parts) do
          if v == "src" then
            if is_test_file then
              table.insert(namespace_parts, filepath_parts[k - 2])
            else
              table.insert(namespace_parts, filepath_parts[k - 1])
            end
          end
        end

        -- Add the rest of the namespace.
        local namespace = vim.split(filepath, "src/")
        local final_part = (namespace[2] or ""):gsub("/", "\\")
        table.insert(namespace_parts, final_part)

        return table.concat(namespace_parts, "\\")
      end),
      f(function()
        return vim.fn.expand "%:t:r"
      end),
      i(0),
    }
  ),

  func = fmta("function <>(<>)<> {\n  <>\n}<>", { i(1), i(2), i(3), i(4), i(0) }),

  met = fmta(
    [[
    <> function <>(<>)<> {
      <>
    }<>
    ]],
    { c(1, { t "public", t "protected", t "private" }), i(2), i(3), i(4), i(5), i(0) }
  ),

  pest = fmta("<>('<>', function() {\n  <>\n});", { c(1, { t "it", t "test" }), i(2), i(0) }),

  test = fmta(
    [[
    /** @test */
    public function <><>(): void {
      <>
    }<>
    ]],
    { c(1, { t "test", t "it", t "should" }), i(2), i(3), i(0) }
  ),
}

return M
