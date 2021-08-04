" colors
syntax on
colorscheme dim

" settings
set nu rnu              " Set hybrid numbering

set tabstop=4           " Replace tabs with 4 spaces
set expandtab
set shiftwidth=4        " Ensure shifting will also use 4 spaces

set colorcolumn=80
set ai
set si
set ruler
set scrolloff=10        " Determines when the window should shift up/down

" remaps
inoremap jk <esc>
" determine syntax id for coloring purposes
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
