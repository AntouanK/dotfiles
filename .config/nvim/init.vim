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
set relativenumber
set cursorline

" show invisibles
set list
set listchars=eol:¬,space:·,tab:>-,trail:~,extends:>,precedes:<
set colorcolumn=90

" disable swap files
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""
" custom commands
nnoremap <Leader>q :bd<CR>
nnoremap <Leader><Tab> :bn!<CR>
nnoremap <Leader>w :silent w!<CR>

" automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" build the project on every save
"autocmd BufWritePost *.elm :term make build ELM_MODE=development

autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

:augroup haskell-formatting
:   autocmd BufWritePost *.hs silent! !brittany indent=4 --write-mode=inplace <afile>
:   autocmd BufWritePost *.hs silent! !stylish-haskell -i <afile>
:   autocmd BufWritePost * :edit
:augroup END

" formatting js files
let g:formatJsEnabled = 1
function! ToggleFormatJs()
    if g:formatJsEnabled == 0
        let g:formatJsEnabled = 1
    else
        let g:formatJsEnabled = 0
    endif
    :echom g:formatJsEnabled
endfunction

function! FormatJs()
    if g:formatJsEnabled == 1
        !prettier --write <afile>
        :edit
    endif
endfunction

autocmd BufWritePost *.js call FormatJs()
autocmd BufWritePost *.ts call FormatJs()

""""""""""""""""""""""""""""""""""'
" persistent undo
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.config/nvim/undo  "directory where the undo files will be stored
endif

"""""""""""""""""""""""""""""""""""""""""""""
" plugins
call plug#begin()

" general coding things
Plug 'tpope/vim-sensible'
Plug 'w0rp/ale' " Linter and Fixer
" Auto-complete
let g:deoplete#enable_at_startup = 1
Plug 'airblade/vim-gitgutter' " Git diff next to the line number
Plug 'tpope/vim-fugitive' " Git support
Plug 'neoclide/coc.nvim', {'do': './install.sh nightly'}
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>] <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"Plug 'valloric/youcompleteme'
"let g:ycm_semantic_triggers = {
"     \ 'elm' : ['.'],
"     \ 'typescript' : ['.']
"     \}


" Elm
"Plug 'kbsymanz/ctags-elm'
Plug 'antew/vim-elm-analyse', { 'do': 'npm i -g elm-analyse' }
Plug 'antew/vim-elm-language-server'
Plug 'elmcast/elm-vim'
let g:elm_format_autosave = 1
let g:elm_make_show_warnings = 1
"let g:elm_make_output_file = "./dist/elm.js"
let g:elm_detailed_complete = 1
let g:elm_setup_keybindings = 0

" colors scheme
"Plug 'jacoborus/tender.vim'
"Plug 'mhartington/oceanic-next'

" ripgrep
Plug 'jremmen/vim-ripgrep'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
"let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_left_alt_sep= ''
"let g:airline_left_sep = ''
let g:airline_section_z = ''
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'tender'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](elm-stuff|dist|.stack-work|node_modules)$'
  \ }
let g:ctrlp_clear_cache_on_exit = 1

Plug 'tpope/vim-surround'

"" Typescript
"Plug 'leafgarland/typescript-vim'
" This plugin includes a custom indenter (based on pangloss/vim-javascript's indenter), it works pretty well but there are cases where it fails. If these bother you or want to use other indent settings you can disable it by setting a flag in your .vimrc:
"let g:typescript_indent_disable = 1

"""""" Haskell

"Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
"Plug 'Shougo/vimproc.vim', {'do': 'make'}
"Plug 'Shougo/neocomplete.vim', {'for': 'haskell'}
"Plug 'eagletmt/neco-ghc', {'for': 'haskell'}

"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>

"let g:LanguageClient_serverCommands = {
"    \ 'haskell': ['hie', '--lsp'],
"    \ }

" you neet apply-refact for this one
"Plug 'mpickering/hlint-refactor-vim'

"Plug 'bitc/vim-hdevtools'

"nnoremap <Leader>c :GhcModCheckAsync<CR>
"nnoremap <Leader>t :GhcModType<CR>
"nnoremap <Leader>r :GhcModTypeClear<CR>
"au FileType haskell nnoremap <buffer> <Leader>t :GhcModType<CR>
"au FileType haskell nnoremap <buffer> <silent> <Leader>r :GhcModTypeClear<CR>
""""""""""""""""""" Haskell

Plug 'ryanoasis/vim-devicons'

Plug 'chriskempson/base16-vim'

Plug 'mustache/vim-mustache-handlebars'

call plug#end()


set diffopt+=vertical

function! ShowElmMakeOutput()
   let currentBufferName = bufname("%")
   let elmMakeOutput = system("elm-make " . currentBufferName . " --output /dev/null 2>&1")
   let i = bufnr("$")
   let g:elmBufferExists = 0
   while (i >= 1)
       if (getbufvar(i, "&filetype") == "elm-make-output")
           let g:elmBufferExists = 1
       endif
       let i-=1
   endwhile

   if !g:elmBufferExists
       rightbelow 80vsplit __ElmMake__
       setlocal filetype=elm-make-output
       setlocal buftype=nofile
       let g:elmMakeWindowId = win_getid()
   endif

   if win_gotoid(g:elmMakeWindowId)
       normal! ggdG
       call append(0, split(elmMakeOutput, '\v\n'))
       normal! gg
       wincmd w
   endif
endfunction

" to enable, uncomment this line:
"autocmd BufWritePost *.elm call ShowElmMakeOutput()


" max line number
match ErrorMsg '\%>80v.\+'
match ErrorMsg '\s\+$'


colorscheme base16-nord
"colorscheme OceanicNext
