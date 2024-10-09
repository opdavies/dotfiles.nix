local fmta = require("luasnip.extras.fmt").fmta
local ls = require "luasnip"
local rep = require("luasnip.extras").rep

local c = ls.choice_node
local i = ls.insert_node
local t = ls.text_node

local M = {
  drupal_info = fmta(
    [[
    name: <module_name>
    description: <description>
    core_version_requirement: ^10 || ^11
    type: <type>
    package: <package>
    ]],
    { module_name = i(1), description = i(2), type = c(3, { t "module", t "theme" }), package = i(0) }
  ),

  drupal_route = fmta(
    [[
    <module>.<route>:
      path: /<path>
      defaults:
        _controller: Drupal\<module_same>\Controller\<class>
        # _form:
        # _title:
        # _title_callback:
      methods: [GET]
      requirements:
        _permission: access content
        # _access: TRUE<finish>
    ]],
    { module = i(1), route = i(2), path = i(3), module_same = rep(1), class = i(4), finish = i(0) }
  ),
}

return M
