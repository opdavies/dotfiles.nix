let g:coc_global_extensions = ['coc-angular', 'coc-css', 'coc-emmet', 'coc-esbonio', 'coc-git', 'coc-go', 'coc-html', 'coc-json', 'coc-markdownlint', 'coc-php-cs-fixer', 'coc-phpls', 'coc-sh', 'coc-svg', 'coc-tailwindcss', 'coc-tsserver', 'coc-vetur', 'coc-vimlsp', 'coc-yaml', 'coc-yank']

nmap <Leader>a <Plug>(coc-codeaction)
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>gi <Plug>(coc-implementation)
nmap <Leader>gt <Plug>(coc-type-definition)
nmap <Leader>sr <Plug>(coc-rename)
nmap <Leader>rf <Plug>(coc-refactor)
nnoremap <silent> K :call <SID>show_documentation()<CR>
