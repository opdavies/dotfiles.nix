let mapleader = " "

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.config/nvim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-sort-motion'
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
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
call plug#end()

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
