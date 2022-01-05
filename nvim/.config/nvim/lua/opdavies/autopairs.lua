local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

autopairs.setup {}

local cmp_status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_status_ok then
  return
end

local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({
  map_char = { tex = '' }
}))
