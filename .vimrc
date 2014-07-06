"--------------------------------------------------------------------------------
"            _             _                  _                    
"   ___ ___ (_)_   _ _ __ (_) ___  _ ____   _(_)_ __ ___  _ __ ___ 
"  / __/ __|| | | | | '_ \| |/ _ \| '__\ \ / / | '_ ` _ \| '__/ __|
"  \__ \__ \| | |_| | | | | | (_) | | _ \ V /| | | | | | | | | (__ 
"  |___/___// |\__,_|_| |_|_|\___/|_|(_) \_/ |_|_| |_| |_|_|  \___|
"         |__/                                                    
"
"--------------------------------------------------------------------------------

"--------------------------------------------------------------------------------
" Disable VI compatibility
"--------------------------------------------------------------------------------

set nocompatible

"--------------------------------------------------------------------------------
" NeoBundle auto-installation and setup 
"--------------------------------------------------------------------------------

let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif

if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand($HOME.'/.vim/bundle/'))
  
"--------------------------------------------------------------------------------
" Bundles
"--------------------------------------------------------------------------------

" Autocomplete
NeoBundle 'Shougo/neocomplete'

" Code Snippets
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'tpope/vim-commentary'

" My preferred theme
NeoBundle 'tomasr/molokai'

" Auto install of Bundles 
NeoBundle 'Shougo/neobundle.vim'

NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Status line whit powerline
NeoBundle 'bling/vim-airline'

" Python coding
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
NeoBundle'jmcantrell/vim-virtualenv'

" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}

" Easy move in document
NeoBundle 'Lokaltog/vim-easymotion'

" Vimrepeat
NeoBundle 'tpope/vim-repeat'

" Insert delimiters autmagically {} () []
NeoBundle 'Raimondi/delimitMate'

NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

filetype plugin indent on      " Indent and plugins by filetype
 
"--------------------------------------------------------------------------------
" Set Leader mapping
"--------------------------------------------------------------------------------

let mapleader=','
let maplocalleader= ' '

"--------------------------------------------------------------------------------
" Backups 
"--------------------------------------------------------------------------------
 
" Make a dir if no exists 

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

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

"--------------------------------------------------------------------------------
" Enable mouse
"--------------------------------------------------------------------------------

set mouse=a
 
"--------------------------------------------------------------------------------
" Tabs, space and wrapping
"--------------------------------------------------------------------------------

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

"-----------------------------------------------------------
" Wildmenu
"-----------------------------------------------------------

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?              " Vim swap files
set wildignore+=*.bak             " Backup files
set wildignore+=*.pyc               " Python byte code

"--------------------------------------------------------------------------------
" Default Config
"--------------------------------------------------------------------------------

syntax enable                  " enable the syntax highlight
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

"--------------------------------------------------------------------------------
" Return to last edit position when opening files (You want this!)
"--------------------------------------------------------------------------------

autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif

"--------------------------------------------------------------------------------
" Searching 
"--------------------------------------------------------------------------------
 
set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

"--------------------------------------------------------------------------------
" History and permanent undo levels
"--------------------------------------------------------------------------------

set history=1000                
set undofile
set undoreload=1000

"--------------------------------------------------------------------------------
" Tabs, space and wrapping
"--------------------------------------------------------------------------------

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

"--------------------------------------------------------------------------------
" Show 80 column limit
"--------------------------------------------------------------------------------
 
set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

"--------------------------------------------------------------------------------
" Colorscheme 
"--------------------------------------------------------------------------------

let g:rehash256 = 1
colorscheme molokai

"--------------------------------------------------------------------------------
" Autoload configuration when this file changes ($MYVIMRC)
"--------------------------------------------------------------------------------

autocmd! BufWritePost vimrc source %

"--------------------------------------------------------------------------------
" Powerline Font
"--------------------------------------------------------------------------------

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 30

"--------------------------------------------------------------------------------
" Airline
"--------------------------------------------------------------------------------

set noshowmode
let g:airline_theme='powerlineish'
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

"--------------------------------------------------------------------------------
" Show hidden chars
"--------------------------------------------------------------------------------

nmap <Leader>eh :set list!<CR>
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

"--------------------------------------------------------------------------------
" ZoomWinTabToggle
"--------------------------------------------------------------------------------

map <Leader>z :ZoomWinTabToggle<CR>

"--------------------------------------------------------------------------------
" Gundo
"--------------------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_preview_bottom = 1

"--------------------------------------------------------------------------------
" Delete trailing whitespaces 
"--------------------------------------------------------------------------------

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"--------------------------------------------------------------------------------
" Toggle line numbers 
"--------------------------------------------------------------------------------

nnoremap <silent><Leader>n :call ToggleRelativeAbsoluteNumber()<CR>
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


"--------------------------------------------------------------------------------
" toggle paste mode
"--------------------------------------------------------------------------------

map <Leader>P :set invpaste<CR>

"--------------------------------------------------------------------------------
" Use Ranger as a file explorer {{{
"--------------------------------------------------------------------------------

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>r :call RangerChooser()<CR>

"--------------------------------------------------------------------------------
" Cut/Paste to/from the clipboard
"--------------------------------------------------------------------------------

map <Leader>y "*y
map <Leader>p "*p

"--------------------------------------------------------------------------------
" Comment/Uncomment
"--------------------------------------------------------------------------------

map <Leader>c gc

"--------------------------------------------------------------------------------
" Fold/Unfold
"--------------------------------------------------------------------------------

set foldmethod=marker
map <Leader>f za


" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Fast window & buffer close and kill {{{

nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

"--------------------------------------------------------------------------------
" Code Folding 
"--------------------------------------------------------------------------------

set foldmethod=indent
set foldlevel=1000


"--------------------------------------------------------------------------------
" PythonMode 
"--------------------------------------------------------------------------------

let g:pymode = 1 
let g:pymode_indent = 1
let g:pymode_folding = 1

" Code run
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

" Breakpoints
let g:pymode_breakpoint = 1

" Breakpint bind key
let g:pymode_breakpoint_bind = '<leader>b'

" Manually set breakpoint command (leave empty for automatic detection)
let g:pymode_breakpoint_cmd = ''

" Code check
let g:pymode_lint = 1

" Check code on every save (if file has been modified)  
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0

" Check code when editing (on the fly)                        
let g:pymode_lint_on_fly = 1

" Show error message if cursor placed at the error line  
let g:pymode_lint_message = 1

" Default code checkers (you could set several)         
" Values may be chosen from: `pylint`, `pep8`, `mccabe`, `pep257`, `pyflakes`.
let g:pymode_lint_checkers = ['pylynt', 'pyflakes', 'pep8', 'mccabe']

" Skip errors and warnings                                
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors that starts with E2) and etc
"let g:pymode_lint_ignore = "E501,W"

" Select some error or warnings.
" By example you disable all warnings starting from 'W', but want to see warning
" 'W0011' and warning 'W430'
"let g:pymode_lint_select = "E501,W0011,W430"

" Sort errors by relevance
" If not empty, errors will be sort by defined relevance
" E.g. let g:pymode_lint_sort = ['E', 'C', 'I']  " Errors first 'E',
" after them 'C' and ...
let g:pymode_lint_sort = ['E', 'C', 'I']

" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6 

" Place error |signs|
let g:pymode_lint_signs = 1

" Definitions for |signs|
let g:pymode_lint_todo_symbol = 'TD'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = '⚡R'
let g:pymode_lint_error_symbol = '✗E'
let g:pymode_lint_info_symbol = '⚠I'
let g:pymode_lint_pyflakes_symbol = '⚡F'

" Set PEP8 options
let g:pymode_lint_options_pep8 = { 'max_line_length': 80 }   

" Set Pyflakes options                          
let g:pymode_lint_options_pyflakes = { 'builtins': '_' }

" Set mccabe options                              
let g:pymode_lint_options_mccabe = { 'complexity': 12 }

" Set pep257 options
let g:pymode_lint_options_pep257 = {}

" Set pylint options
let g:pymode_lint_options_pylint = { 'max-line-length': 80 } 

let g:pymode_virtualenv = 0

nmap <silent><Leader>n :PymodeLint<CR>

" Trim unused white spaces on save                  
let g:pymode_trim_whitespaces = 1

"--------------------------------------------------------------------------------
" Enable Virtualenv
"--------------------------------------------------------------------------------

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

"--------------------------------------------------------------------------------
" Syntastic
"--------------------------------------------------------------------------------

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

let g:syntastic_always_populate_loc_list = 1

"--------------------------------------------------------------------------------
" NeoComplete/Autocomplete
"--------------------------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

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
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

"--------------------------------------------------------------------------------
" EasyMotion
"--------------------------------------------------------------------------------

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
