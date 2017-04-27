
set nocompatible

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
set guifont=Inconsolata\ for\ Powerline\ Medium\ 12

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
set relativenumber

" show invisibles
set list
set listchars=eol:¬,space:·,tab:>-,trail:~,extends:>,precedes:<

" disable swap files
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""
" custom commands
nnoremap <Leader><Tab> :bn!<CR>
nnoremap <Leader>q :bd<CR>

" build the project on every save
autocmd BufWritePost *.elm :term make build ELM_MODE=development

" Quick window motion mappings
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


""""""""""""""""""""""""""""""""""'
" persistent undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature  
  set undodir=$HOME/.config/nvim/undo  "directory where the undo files will be stored
endif   

"""""""""""""""""""""""""""""""""""""""""""""
" plugins
call plug#begin()

Plug 'tpope/vim-sensible'
set diffopt+=vertical

Plug 'elmcast/elm-vim'
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
let g:elm_make_output_file = "./dist/elm.js"
let g:elm_detailed_complete = 1

" colors scheme
Plug 'jacoborus/tender.vim'

" git plugin
Plug 'tpope/vim-fugitive'

" tree file navigation
"Plug 'scrooloose/nerdtree'
"map <C-n> :NERDTreeToggle<CR>

"Plug 'scrooloose/syntastic'
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:elm_syntastic_show_warnings = 1

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1

"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = ''
let g:airline_powerline_fonts = 1

Plug 'airblade/vim-gitgutter'

Plug 'valloric/youcompleteme'
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}

Plug 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](elm-stuff|dist)$'
  \ }

Plug 'mileszs/ack.vim'

Plug 'tpope/vim-surround'

call plug#end()


