"clipboard setting
set clipboard=autoselect
set clipboard+=unnamed
set clipboard=unnamedplus

"mouse can use
set mouse=a

"print number
set number

"set title
set title

set whichwrap=b,s,h,l,<,>,[,]
set ambiwidth=double

"tab equals two space
set tabstop=2

"background color
set background=dark

"syntax
syntax on

"tab key -> space key
set expandtab

"if autoindent on, indent two space
set shiftwidth=2

"autoindent
set cindent

"print status line at second line
set laststatus=2

"show command
set showcmd

"print tab, trail, eol, etc...
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"remove octal and only hex
set nrformats-=octal

"if open unsaved file, another file can open
set hidden

"history limit
set history=50

"if visual mode, not exist range can select
set virtualedit=block

"can move between the lines
set whichwrap=b,s,[,],<,>

"backspace can always use in vim
set backspace=indent,eol,start

"when vim open file, file name conpletion
set wildmenu

"stand out cursor
set cursorline
set cursorcolumn

set noswapfile

"inoremap settings
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

"nnoremap"
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k

"if title prtint 'Thanks for flying vim', notitle remove this message
"set notitle

"can use 256 color
set t_Co=256

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin('$HOME/.vim/dein')

" Let dein manage dein
call dein#add('Shougo/dein.vim')

" add plugin
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoinclude.vim')
call dein#add('tomasr/molokai')
call dein#add('Shougo/neocomplete.vim')
call dein#add('thinca/vim-quickrun')
call dein#add('Shougo/vimproc')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('jceb/vim-hier')
call dein#add('dannyob/quickfixstatus')
call dein#add('Konfekt/FastFold')
call dein#add('rust-lang/rust.vim')
call dein#add('racer-rust/vim-racer')
call dein#add ('plasticboy/vim-markdown')
call dein#add ('kannokanno/previm')
call dein#add ('tyru/open-browser.vim')
call dein#add ('othree/html5.vim')
call dein#add ('Shougo/unite.vim')
call dein#add ('Shougo/neomru.vim')
call dein#add ('basyura/unite-rails')
call dein#add ('osyo-manga/vim-monster')
call dein#add ('tpope/vim-rails')

call dein#end()

filetype plugin indent on

"if not yet installed plagin exist, these install.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
colorscheme molokai
let g:molokai_original=1

"FastFold-----------------------------------
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1

"neocomplete---------------------------------
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#max_list = 20

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" AutoComplPop like behavior.
" let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

"watchdogs settings

let g:quickrun_config={}

let s:config = {
      \   "watchdogs_checker/_" : {
      \       "hook/copen/enable_exist_data" : 1,
      \       "hook/u_nya_/enable" : 1,
      \       "hook/inu/enable" : 0,
      \       "hook/unite_quickfix/enable" : 0,
      \       "hook/echo/enable" : 0,
      \       "hook/back_buffer/enable" : 0,
      \       "hook/close_unite_quickfix/enable" : 0,
      \       "hook/close_buffer/enable_exit" : 0,
      \       "hook/close_quickfix/enable_exit" : 1,
      \       "hook/redraw_unite_quickfix/enable_exit" : 0,
      \       "hook/close_unite_quickfix/enable_exit" : 1,
      \       "runner" : "vimproc",
      \       "runner/vimproc/updatetime" : 40
      \   },
      \
      \   "cpp/watchdogs_checker" : {
      \       "hook/add_include_option/enable" : 1,
      \       "type" : "watchdogs_checker/g++",
      \   },
      \
      \   "haskell/watchdogs_checker" : {
      \       "type" : "watchdogs_checker/hlint",
      \   },
      \   "watchdogs_checker/msvc" : {
      \       "hook/msvc_compiler/enable" : 1,
      \       "hook/msvc_compiler/target" : "c:/program files/microsoft visual studio 10.0",
      \       "hook/output_encode/encoding" : "sjis",
      \       "cmdopt" : "/Zs ",
      \   },
      \
      \   "watchdogs_checker/g++" : {
      \       "cmdopt" : "-std=gnu++0x -Wall",
      \   },
      \
      \   "watchdogs_checker/clang++" : {
      \       "cmdopt" : "-std=gnu++0x -Wall",
      \   },
      \
      \   "python/watchdogs_checker" : {
      \       "type" : "watchdogs_checker/pyflakes",
      \   },
      \   
      \   "watchdogs_checker/pyflakes" : {
      \       "command" : "c:/python27/scripts/pyflakes",
      \   },
      \}

let g:watchdogs_check_BufWritePost_enable = 1

let g:watchdogs_check_BufWritePost_enables = {
      \           "rust" : 0
      \}

let g:watchdogs_check_CursorHold_enable = 1


call extend(g:quickrun_config, s:config)
unlet s:config

call watchdogs#setup(g:quickrun_config)

"Rust----------------------------------------------------
let g:rustfmt_autosave = 1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

let g:racer_cmd = '$HOME/.cargo/bin/racer'

let $RUST_SRC_PATH='$HOME/.rust/rust/src'
"Markdown-----------------------------------------------
augroup PrevimSettings
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END
"Unite.vim
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"Unite-rails
nnoremap <silent> ,urm :<C-u>Unite rails/model<CR>
nnoremap <silent> ,urv :<C-u>Unite rails/view<CR>
nnoremap <silent> ,urc :<C-u>Unite rails/controller<CR>
nnoremap <silent> ,uro :<C-u>Unite rails/route<CR>
nnoremap <silent> ,urs :<C-u>Unite rails/stylesheet<CR>
nnoremap <silent> ,urh :<C-u>Unite rails/helper<CR>
nnoremap <silent> ,urg :<C-u>Unite rails/config<CR>

"ruby completion
let g:monster#completion#rcodetools#backend = "async_rct_complete"

let g:neocomplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
