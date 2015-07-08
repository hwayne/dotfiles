" Environment {

    " Basics {
        set nocompatible        " Must be first line
        if !(has('win16') || has('win32') || has('win64'))
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if has('win32') || has('win64')
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
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

    " Use local bundles if available {
        if filereadable(expand("~/.vimrc.bundles.local"))
            source ~/.vimrc.bundles.local
        endif
    " }

    " Use fork bundles if available {
        if filereadable(expand("~/.vimrc.bundles.fork"))
            source ~/.vimrc.bundles.fork
        endif
    " }

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


" General {

    set background=dark         " Assume a dark background
    if !has('gui')
        "set term=$TERM          " Make arrow and other keys work
    endif
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    if has ('x') && has ('gui') " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')          " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened; to prevent this behavior, add the following to
    " your .vimrc.bundles.local file:
       let g:spf13_no_autochdir = 1
    if !exists('g:spf13_no_autochdir')
        autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
        " Always switch to the current file directory
    endif

    "set autowrite                       " Automatically write a file when leaving a modified buffer
    "set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
""    set spell                           " Spell checking on
    set hidden                          " Allow buffer switching without saving

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    "au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

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

    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
        color solarized                 " Load a colorscheme
    endif
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode

    set cursorline                  " Highlight current line
    set cursorcolumn                " Highlight current column

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    highlight clear LineNr          " Current line number row will have same background color in relative mode.
                                    " Things like vim-gitgutter will match LineNr highlight
    "highlight clear CursorLineNr   " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
        Bundle 'bling/vim-airline'
    endif

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
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

"TODO: MOVE MAPS TO OWN FILE
"Leader
let mapleader="\<Space>"
set pastetoggle=<F10>

"Plugin quickstarts
"autocmd vimenter * NERDTree
nmap S :Scratch<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>u :UndotreeToggle<CR>
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :w<cr>:source $MYVIMRC<cr>
nnoremap <c-o><c-p> :CtrlPBufTag<CR>
noremap - :Switch<CR>
noremap <leader>r <c-W>v<c-W>l:A<cr>
nmap <F8> :TagbarToggle<CR>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

let NERDTreeIgnore = ['\~$', '\.pyc']
let g:pymode_lint_on_write = 0
let g:UltiSnipsListSnippets = '``'
set completeopt-=preview


:inoremap jk <Esc>
:inoremap JK <Esc>

"Better copy/paste

noremap <leader>ds :%s/\s*$//<cr>:noh<cr>

noremap Y y$
vnoremap <c-c> :w !pbcopy<cr><cr>
noremap <leader>cp :set paste<cr>i<c-R>*<esc>:set nopaste<cr>

"Git searching

nnoremap <leader>/ :!git grep <c-r>=expand('<cword>')<CR><CR>

"splitscreen maps

noremap qw <NOP>
"noremap <c-w> <NOP>

"misc Maps

"noremap ; :
noremap \\ :wa<return>
noremap Q @@

"exiting
noremap ZA :wa<cr>:qa<cr>
noremap ZC :qa!<cr>

"Navigation

nnoremap K i<cr><esc>
"noremap j gj
"noremap k gk
"noremap gj j
"noremap gk k
noremap ^ H
noremap $ L
noremap H ^
noremap L $

noremap jj <nop>
noremap kk <nop>
noremap hh <nop>
noremap ll <nop>

"free line adding

noremap go o<esc>
noremap gO O<esc>

"remote move/copy line

noremap <leader>dk :<C-U>execute "normal! ".v:count."kdd".v:count."jkPj"<CR>
noremap <leader>k :<C-U>execute "normal! ".v:count."kyy".v:count."jPj"<CR>
noremap <leader>dj :<C-U>execute "normal! ".v:count."jdd".v:count."kjP"<CR>
noremap <leader>j :<C-U>execute "normal! ".v:count."jyy".v:count."kp"<CR>

"SWANK MACROS
"Highlight words without moving cursor
noremap <leader><leader>h *#
noremap <leader><leader>s ^yyp^cwexpectf,c3l.f'xA.toHaveBeenCalled()

"Fast testing
noremap <leader>t :!python manage.py test<cr>

"Hf'lvi'"bpF.x
"goqwkHf'"aya'f}F."byt"Hf'lvi'"bpF.xgjHqwji"b":jkF.xA a,jk==@q
"ayiwdd/aLN~F(dFEiHandlebars.templates.jk"apbf'df 
"Spelling errors constant
iab Monocole Monocle
iab monocole monocle
iab cons console.log

noremap \l :let @+ = expand('%')<cr>
