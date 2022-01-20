syntax on               " turn syntax highlighting on
colorscheme gruv        " custom colorscheme

" settings
set nu rnu              " Set hybrid numbering
set expandtab           " Replace tabs with spaces
set tabstop=4           " Ensure tabing will be 4 spaces
set shiftwidth=4        " Ensure shifting will also use 4 spaces

set splitbelow          " Horizontal splits open on the bottom
set splitright          " Vertical splits open on the right

set nu rnu              " Set hybrid numbering
set ai                  " Auto indent
set si                  " Smart indent
set ruler               " Display cursor position in bottom right

set scrolloff=10        " Determines when the window should shift up/down
set noswapfile          " Disables swap files from unexpected session closes
set hls                 " Default highlight search on

" mappings
let mapleader = " " 
inoremap jk <esc> 
nnoremap ; :
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>t :term bash<CR>

" newtr mappings
function! NetrwMapping()
    " navigation maps
    nmap <buffer> H u
    nmap <buffer> h -^
    nmap <buffer> l <CR>
    nmap <buffer> . gh

    " mark maps
    nmap <buffer> <TAB> mf
    nmap <buffer> <S-TAB> mF

    " file maps
    nmap <buffer> ff %:w<CR>:buffer #<CR>
    nmap <buffer> fr R
    nmap <buffer> fc mc
    nmap <buffer> fC mtmc
    nmap <buffer> fm mm
    nmap <buffer> fM mtmm
    nmap <buffer> f; mx
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" netrw settings
let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'

" Disable expandtab for Makefiles, tabs are needed to parse recipes
autocmd FileType make set noexpandtab

" Simple function to determine syntax id for coloring purposes (ctrl-n)
nmap <C-S-N> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

