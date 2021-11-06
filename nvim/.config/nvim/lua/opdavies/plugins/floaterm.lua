local function init()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = true }

  map('n', '<leader>ld', '<cmd>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazydocker<cr>', options)
  map('n', '<leader>lg', '<cmd>FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<cr>', options)
  map('n', '<leader>nn', '<cmd>FloatermNew --autoclose=2 --height=0.5 --width=0.5 nnn -Hde<cr>', options)
  map('n', '<leader>tt', '<cmd>FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<cr>', options)
end

return {
  init = init
}
