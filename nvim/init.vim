
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif
colorscheme tender
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac

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

" show invisibles
set list
set listchars=eol:¬,space:·,tab:>-,trail:~,extends:>,precedes:<

" disable swap files
set noswapfile

call plug#begin()

Plug 'tpope/vim-sensible'

Plug 'elmcast/elm-vim'
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_make_output_file = "./dist/elm.js"

" colors scheme
Plug 'jacoborus/tender.vim'

" git plugin
Plug 'tpope/vim-fugitive'

" tree file navigation
Plug 'scrooloose/nerdtree'


Plug 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:elm_syntastic_show_warnings = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

call plug#end()


