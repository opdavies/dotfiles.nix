" Builtin
nnoremap <leader>fb <CMD>lua require("telescope.builtin").buffers()<CR>
nnoremap <leader>fc <CMD>lua require("telescope.builtin").lsp_code_actions()<CR>
nnoremap <leader>fd <CMD>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>
nnoremap <leader>fe <CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>
nnoremap <leader>ff <CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>
nnoremap <leader>fg <CMD>lua require("telescope.builtin").git_files{}<CR>
nnoremap <leader>fh <CMD>lua require("telescope.builtin").help_tags()<CR>
nnoremap <leader>fl <CMD>lua require("telescope.builtin").live_grep()<CR>
nnoremap <leader>fr <CMD>lua require("telescope.builtin").registers()<CR>
nnoremap <leader>fr <CMD>lua require("telescope.builtin").registers()<CR>
