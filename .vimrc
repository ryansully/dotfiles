""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
  if filereadable(expand("~/.vim/plugins.vim"))
    source ~/.vim/plugins.vim
  endif
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors {{{
  if $TERM_PROGRAM == 'vscode'
    " Use matching color scheme for VS Code Integrated Terminal
    colorscheme codedark
  elseif filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
  endif
  " enable syntax processing
  syntax enable
" }}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Options {{{
"
" The following sections match those found in option-window (:options)
" Full list of options: http://vimhelp.appspot.com/quickref.txt.html#option-list

" {{{ important
  " don't behave Vi-compatible
  " This must be first, because it changes other options as a side effect.
  set nocompatible
" }}}

" {{{ moving around, searching and patterns
  " show match for partly typed search command
  set incsearch
  " ignore case when using a search pattern
  set ignorecase
" }}}

" {{{ displaying text
  " number of screen lines to show around the cursor
  set scrolloff=5
  " long lines don't wrap and continue on the next line
  set nowrap
  " show <Tab> as ^I and end-of-line as $
  "set list
  " list of strings used for list mode
  set listchars=tab:→\ ,trail:·,precedes:«,extends:»
  " show the line number for each line
  set number
  " show the relative line number for each line
  set relativenumber
" }}}

" {{{ syntax, highlighting, and spelling
  " "dark" or "light"; the background color brightness
  set background=dark
  " highlight all matches for the last used search pattern
  set hlsearch
  " highlight the screen column of the cursor
  set cursorcolumn
  " highlight the screen line of the cursor
  set cursorline
  " columns to highlight
  set colorcolumn=81,101
  " highlight text after column 100
  highlight Right100 ctermbg=darkred ctermfg=white guibg=#592929
  match Right100 /\%101v.\+/
" }}}

" {{{ messages and info
  " show (partial) command keys in the status line
  set showcmd
  " show cursor position below for each window
  set ruler
  " use a visual bell instead of beeping
  set visualbell
" }}}

" {{{ editing text
  " specifies what <BS>, CTRL-W, etc. can do in Insert mode
  set backspace=indent,eol,start
" }}}

" {{{ tabs and indenting
  " number of spaces a <Tab> in the text stands for
  set tabstop=2
  " number of spaces used for each step of (auto)indent
  set shiftwidth=2
  " a <Tab> in an indent inserts 'shiftwidth' spaces
  set smarttab
  " expand <Tab> to spaces in Insert mode
  set expandtab
  " automatically set the indent of a new line
  set autoindent
" }}}

" {{{ folding
  " folding type: "manual", "indent", "expr", "marker" or "syntax"
  set foldmethod=indent
" }}}

" {{{ reading and writing files
  " don't keep a backup after overwriting a file
  set nobackup
  " automatically read a file when it was modified outside of Vim
  set autoread
" }}}

" {{{ the swap file
  " don't use a swap file for a buffer
  set noswapfile
" }}}

" {{{ command line editing
  " how many command lines are remembered
  set history=1000
  " command-line completion shows a list of matches
  set wildmenu
" }}}

" }}} /Options

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline {{{

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2  " Always show statusline
set t_Co=256      " Use 256 colours
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode    " Hide default mode text (e.g. -- INSERT -- below statusline)

" Powerline Escape Fix
" https://medium.com/usevim/powerline-escape-fix-e849fd07aad0
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
endif

if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" vim:foldmethod=marker:foldlevel=0
