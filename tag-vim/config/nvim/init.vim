let mapleader = " "

function! s:LoadPlugins()
  call plug#begin('~/.config/nvim/plugged')
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

set complete+=kspell
set expandtab
set foldlevelstart=99 " Start unfolded
set foldmethod=indent
set noswapfile
set nowrap
set number relativenumber
set scrolloff=10 " Automatically scroll
set shiftwidth=2
set smartindent
set tabstop=2 softtabstop=2
set termguicolors

let g:nord_bold_vertical_split_line = 1
let g:nord_cursor_line_number_background = 1

colorscheme nord

" Remaps
nnoremap <leader>pv :Vex<CR>
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Files<CR>

" Remove arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>ne :NERDTreeToggle<CR>

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

autocmd FileType gitcommit highlight ColorColumn ctermbg=8
autocmd FileType gitcommit setlocal colorcolumn=50,72
autocmd FileType gitcommit setlocal textwidth=72
autocmd FileType gitcommit setlocal spell

" Display extra whitespace
set list listchars=tab:»·,trail:·

let g:blamer_delay = 500
let g:blamer_enabled = 1
