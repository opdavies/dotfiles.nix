" Source the current file
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>

" Make the current file executable
nnoremap <Leader>x :!chmod +x %<CR>

" Yank from the current column to the end of the line
nnoremap Y yg$

" Move lines up and down
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-k> :m '<-2<CR>gv=gv
vnoremap <M-j> :m '>+1<CR>gv=gv

" Keep things centred
nnoremap n nzzzv
nnoremap N Nzzzv

" Remove arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Clears hlsearch after doing a search, otherwise just does normal <CR> stuff
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessioniser<CR>
