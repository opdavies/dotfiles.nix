let mapleader = " "

function! s:LoadPlugins()
  call plug#begin('~/.local/share/nvim/plugins')
  source ~/.config/nvim/plugins.vim
  call plug#end()
endfunction

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:LoadPlugins()

syntax on
filetype on
filetype indent on
filetype plugin on

set autoindent
set breakindent
set clipboard+=unnamedplus
set complete+=kspell
set expandtab
set foldlevelstart=99 " Start unfolded
set foldmethod=indent
set formatoptions=l
set linebreak
set mouse=n
set noswapfile
set nowrap
set number relativenumber
set scrolloff=10 " Automatically scroll
set shiftwidth=2
set smartindent
set tabstop=2 softtabstop=2
set termguicolors

call s:SourceConfigFilesIn('plugins')

" Remaps
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>
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

autocmd FileType gitcommit highlight ColorColumn ctermbg=8
autocmd FileType gitcommit setlocal colorcolumn=50,72
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Display extra whitespace
set list listchars=tab:»·,trail:·

nnoremap <silent> <C-f> :silent !tmux neww tmux-sessioniser<CR>

lua require("opdavies")
