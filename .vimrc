" Environment {

    " Basics {
        set nocompatible        " Must be first line
        if !(has('win16') || has('win32') || has('win64'))
            set shell=/bin/sh
        endif
    " }

    " Setup Bundle Support {
        " The next three lines ensure that the ~/.vim/bundle/ system works
        filetype on
        filetype off
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }

" }

" Bundles {

    " Use bundles config {
        if filereadable(expand("~/.vimrc.bundles"))
            source ~/.vimrc.bundles
        endif
    " }

" }

" Use functions {
if filereadable(expand("~/.vimrc.functions"))
  source ~/.vimrc.functions
endif
" }



"
" General {

    set background=dark         " Assume a dark background
    set termguicolors
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    scriptencoding utf-8
    let g:neoterm_shell = "bash"
    Bundle 'morhetz/gruvbox'


    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.bundles.local file:
       let g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    set viewoptions=folds,options,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set hidden                          " Allow buffer switching without saving

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message

    " Setting up the directories {
        if has('persistent_undo')
            set undofile                " So is persistent undo ...
            set undolevels=1000         " Maximum number of changes that can be undone
            set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
        endif

        " To disable views add the following to your .vimrc.bundles.local file:
        "   let g:spf13_no_views = 1
        if !exists('g:spf13_no_views')
            " Add exclusions to mkview and loadview
            " eg: *.*, svn-commit.tmp
            let g:skipview_files = [
                \ '\[example pattern\]'
                \ ]
        endif
    " }


" Vim UI {

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line
    set cursorcolumn                " Highlight current column

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    highlight clear LineNr          " Current line number row will have same background color in relative mode.
                                    " Things like vim-gitgutter will match LineNr highlight
    "highlight clear CursorLineNr   " Remove highlight color from current line number

    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %L,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode

    set statusline=%f%m%r%w%y%=[%L:%p%%][%c%V]

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present

"lines

    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=2                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=2                   " An indentation every four columns
    set softtabstop=2               " Let backspace delete indent

"Autoload rainbow parenthesis
"au VimEnter * RainbowParenthesesToggle
"au Syntax   * RainbowParenthesesLoadRound
"au Syntax   * RainbowParenthesesLoadSquare
"au Syntax   * RainbowParenthesesLoadBraces

"Leader
let mapleader="\<Space>"
set pastetoggle=<F10>

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :w<cr>:source $MYVIMRC<cr>

set completeopt-=preview
set lazyredraw
set wildmenu
set splitbelow
set splitright
set noswapfile
set clipboard=unnamedplus
set inccommand=nosplit

" Use plugin configs {
if filereadable(expand("~/.vimrc.bundles.options"))
  source ~/.vimrc.bundles.options
endif
" }
" Use all of my crazy mappings {

if filereadable(expand("~/.vimrc.mappings"))
  source ~/.vimrc.mappings
endif

command! TT :vs | terminal
command! DumbQuotes %s/“\|”/"/g

" }
