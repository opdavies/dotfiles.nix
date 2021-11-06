local function init()
  vim.g.seiya_auto_enable = 1

  vim.g.seiya_target_groups = { 'guibg' }
end

return {
  init = init
}
