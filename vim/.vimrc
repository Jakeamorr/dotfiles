" colors
syntax on
colorscheme dim

" settings
set relativenumber
set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set ai
set ruler

" remaps
inoremap jk <esc>

" determine syntax for coloring purposes
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
