nmap 0 a

syntax on

au FileType gitcommit highlight ColorColumn ctermbg=8
au FileType gitcommit setlocal colorcolumn=50,72
au FileType gitcommit setlocal textwidth=72

set complete+=kspell
au FileType gitcommit setlocal spell

" folding
set foldlevelstart=99 " Start unfolded
set foldmethod=indent

set noswapfile
set nowrap
set number relativenumber

" Automatically scroll
set scrolloff=10

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

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

" Enable filetype plugins
filetype plugin on

colorscheme nord

" Nerdtree
let g:NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"
nnoremap <leader>ne :NERDTreeToggle<CR>

" Remaps
let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <Leader>so :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :GFiles<CR>
