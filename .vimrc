
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set number

" vim-plug

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'elmcast/elm-vim'
let g:elm_format_autosave = 1

call plug#end()

