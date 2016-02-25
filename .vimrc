"
"
"                        _             _                  _  
"               ___ ___ (_)_   _ _ __ (_) ___  _ ____   _(_)_ __ ___  _ __ ___ 
"              / __/ __|| | | | | '_ \| |/ _ \| '__\ \ / / | '_ ` _ \| '__/ __|
"              \__ \__ \| | |_| | | | | | (_) | | _ \ V /| | | | | | | | | (__ 
"              |___/___// |\__,_|_| |_|_|\___/|_|(_) \_/ |_|_| |_| |_|_|  \___|
"                     |__/                                                    
"
"
"
" Setup language {{{ ==========================================================

language en_US.UTF-8           " Solve some plugins incompatibilities

" }}}

" NEOBUNDLE {{{ ===============================================================

set nocompatible             " No to the total compatibility with the ancient vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" }}}

" Colorschemes {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'
NeoBundle 'tomasr/molokai'

" }}}

" Unite {{{

" NeoBundleLazy 'Shougo/unite.vim'

"}}}

" DCVS {{{
NeoBundle 'airblade/vim-gitgutter'
 
" Git
" NeoBundleLazy 'tpope/vim-fugitive'
 
" }}}

" Python {{{

" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}

" Rope
NeoBundleLazy 'python-rope/ropevim'

" }}}

" File navigation {{{

NeoBundleLazy 'ctrlpvim/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" }}}

" Code Snippets {{{
 
" Autocompletion
NeoBundle 'Shougo/neocomplete' 
NeoBundle 'Shougo/neosnippet' 
NeoBundle 'Shougo/neosnippet-snippets'
 
" }}}

" Syntax {{{

NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
NeoBundle 'scrooloose/syntastic'
NeoBundle 'vim-scripts/SyntaxRange'

" }}}

" Text edition {{{

" Show marks
" NeoBundle 'kshenoy/vim-signature'

" Markdown
NeoBundle 'tpope/vim-markdown'

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'Raimondi/delimitMate'

" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'

" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'

" toggle comments
NeoBundle 'tpope/vim-commentary'

" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}

" easymotion
NeoBundle 'Lokaltog/vim-easymotion'

" }}}

" GUI {{{

" A better looking status line
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
 
" }}}

call neobundle#end()

" END BUNDLES }}}

" Auto install the Plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    set nomore
    NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

" let mapleader = "\<Space>"
let mapleader=','
let maplocalleader= ' '

" }}}

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character
set more                        " to show pages using `more` in command outpouts

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=100
set undoreload=100
set undofile

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

" set wildmenu                        " Command line autocompletion
" set wildmode=list:longest,full      " Shows all the options

" set wildignore+=*.sw?                            " Vim swap files
" set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
" set wildignore+=*.luac                           " Lua byte code
" set wildignore+=*.jar                            " java archives
" set wildignore+=*.pyc                            " Python byte code
" set wildignore+=*.stats                          " Pylint stats

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=100
set colorcolumn=101

" function! ToggleWrap()
"     let s:nowrap_cc_bg = [22, '#005f00']
"     redir => s:curr_cc_hi
"     silent hi ColorColumn
"     redir END
"     let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
"     let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
"     if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
"         let g:curr_cc_ctermbg = s:curr_cc_ctermbg
"     endif
"     if s:curr_cc_guibg != s:nowrap_cc_bg[1]
"         let g:curr_cc_guibg = s:curr_cc_guibg
"     endif
"     if &textwidth == 80
"         set textwidth=0
"         exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
"                     \' guibg='.s:nowrap_cc_bg[1]
"     elseif &textwidth == 0
"         set textwidth=80
"         exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
"                     \' guibg='.g:curr_cc_guibg
"     endif
" endfunction

" nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
if has('gui_running')
    colorscheme molokai
else
    colorscheme molokai256
endif

" }}}

" Font {{{

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Fast window & buffer close and kill {{{

nnoremap <Leader>K <C-w>c
nnoremap <silent><Leader>k :bd<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" }}}

" Folding {{{

set foldmethod=syntax

" Salva folding
set viewoptions-=options
augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Autoload configuration when this file changes ($MYVIMRC) {{{

autocmd! BufWritePost vimrc source %

" }}}

" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Quick saving {{{

nmap <silent> <Leader>w :update<CR>
nmap <silent> <Leader>w :update<CR>
inoremap jw <esc>:w<CR>

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" CtrlP configuration {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf,*.pyc
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'


" }}}

" Use Ranger as a file explorer {{{

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>
" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Toggle Mouse {{{

set mouse=a

fun! s:ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif
    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction

noremap <Leader>mm :call <SID>ToggleMouse()<CR>
inoremap <Leader>mm <Esc>:call <SID>ToggleMouse()<CR>a

" "}}}

" Basic options {{{

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" }}}

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Fast buffer jump, home, end, save, esc {{{

nnoremap p[ <esc>:bn<cr>
nnoremap [p <esc>:bp<cr>
" inoremap zz <esc>ui
" inoremap hh <esc>0i
inoremap jk <esc>
" inoremap <esc> <nop>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================

" Airline {{{

set noshowmode

let g:airline_theme='powerlineish'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#detect_whitespace#enabled = 1
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" " ColorV {{{

" let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
" let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" " }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
    au FileType xquery setlocal commentstring=(:\ %s\ :)
augroup END

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" Gundo {{{ ------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 1
" let g:indentLine_char = '┊'
let g:indentLine_char = '│'
let g:indentLine_color_term = 239

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 50
let g:neocomplete#min_keyword_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'
let g:neocomplete#enable_fuzzy_completion = 1

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 1

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ neocomplete#start_manual_complete()

function! s:check_back_space() "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" neosnippet Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/Dev/vim-snippets/snippets'

let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['python'] = 'django,python'

set completeopt-=preview

" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PymodeLint<CR>
nmap <silent><Leader>la :PymodeLintAuto<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_checkers = ['pylint']

let g:pymode_options_max_line_length=100

" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors that starts with E2) and etc
let g:pymode_lint_ignore = "C0103,C0111,C1001,C0330,E1002,E1101,E1120,E1123,R0902,R0903,R0912,R0913,R0914,R0915,W0142,W0201,W0232"

" Select some error or warnings.
" By example you disable all warnings starting from 'W', but want to see warning
" 'W0011' and warning 'W430'
"let g:pymode_lint_select = "E501,W0011,W430"

let g:pymode_lint_sort = ['E', 'C', 'I']

let g:pymode_virtualenv = 1
let g:pymode_rope = 0

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" Trim unused white spaces on save
let g:pymode_trim_whitespaces = 1

" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 8

" Check code when editing (on the fly)
let g:pymode_lint_on_fly = 0

" Show error message if cursor placed at the error line
let g:pymode_lint_message = 1

let g:pymode_indent = 1
let g:pymode_motion = 1

let g:pymode_folding = 1

" }}}

" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:syntastic_quiet_messages = { "regex": ['missing-docstring', 'bad-continuation', 'no-member'] }

" }}}

" easymotion {{{ -----------------------------------------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" }}}

" last position {{{ --------------------------------------------------------------------------------
" Return to last edit position when opening files (You want this!)
"--------------------------------------------------------------------------------

autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{ ==============================================================

" DJANGO HTML (Templates) {{{

au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" }}}

" END FILETYPES }}}

" " Other Customizations {{{ ====================================================

" let s:vimcustomfile = $HOME.'/.vim/custom.vim'

" if filereadable(s:vimcustomfile)
"     exec 'source '.s:vimcustomfile
" endif

" " }}}
