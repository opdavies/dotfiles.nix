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
call s:SourceConfigFilesIn('plugins')

lua require("opdavies")

