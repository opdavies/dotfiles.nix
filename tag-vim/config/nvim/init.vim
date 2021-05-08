nmap 0 a

syntax on

au FileType gitcommit highlight ColorColumn ctermbg=8
au FileType gitcommit setlocal colorcolumn=50,72
au FileType gitcommit setlocal textwidth=72
au FileType gitcommit setlocal spell

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
call plug#end()

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

" Enable filetype plugins
filetype plugin on

colorscheme nord

" Remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>

" Remove arrow keys
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Ctrl+C should write the file
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>ne :NERDTreeToggle<CR>

let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>ne :NERDTreeToggle<CR>

