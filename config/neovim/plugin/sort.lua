require("sort").setup()

vim.cmd([[
  nnoremap <silent> go" vi"<Esc><Cmd>Sort<CR>
  nnoremap <silent> go' vi'<Esc><Cmd>Sort<CR>
  nnoremap <silent> go( vi(<Esc><Cmd>Sort<CR>
  nnoremap <silent> go[ vi[<Esc><Cmd>Sort<CR>
  nnoremap <silent> gop vip<Esc><Cmd>Sort<CR>
  nnoremap <silent> go{ vi{<Esc><Cmd>Sort<CR>
]])
