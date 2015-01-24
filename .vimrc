" Disables vi compatibility
set nocompatible

" ###########################################################################
" Vundle
" ###########################################################################

" Required to setup vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

" Nice golang extension.
Plugin 'fatih/vim-go'

" Syntax checking.
Plugin 'scrooloose/syntastic'

" Python pep8 linting.
Plugin 'nvie/vim-flake8'

" Auto bracket closing.
Plugin 'Raimondi/delimitMate'

" Align tabular-ish text
Plugin 'godlygeek/tabular'

" Easily add, subtract quotes / parentheses, etc
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ###########################################################################
" General
" ###########################################################################

" Enable syntax highlighting
syntax enable

" This shows what you are typing in the status line.
set showcmd

" Enable autoindent
set autoindent

" Enable tab-completion in the vim command line
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in the console
set mouse=a

" Make backspace act like it does in other apps e.g. delete across line breaks,
" etc.
set backspace=2

" Show line numbers
set number

" Ignore case when performing searches
set ignorecase

" Works in concert with ignorecase. With both of these options set, if a search
" pattern contains an uppercase letter, then the search is case sensitive
" otherwise, it is not.
set smartcase

" Incrementally search for search strings
set incsearch

" Highlight matching search matches
set hlsearch

" When closing tabs, get rid of the buffer, too
set nohidden

" Highlight the matching parenthesis
highlight MatchParen ctermbg=4

" Helpful status line
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Set our default colorscheme
colorscheme molokai

" Number of lines to show above or below the cursor while scrolling.
set scrolloff=2

" Set the default encoding to utf-8.
set encoding=utf-8

" Re-read files that have change automatically.
set autoread

" Set a longer history list
set history=1000

" Nice invisible character representations
set listchars=trail:-,extends:>,precedes:<,nbsp:+,tab:▸\ ,eol:¬

" Delete comment character when joining commented lines, if our version
" supports it.
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" ###########################################################################
" Filetype Specific
" ###########################################################################

" Python file only settings
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" golang file only settings
autocmd Filetype go setlocal  tabstop=4

" ###########################################################################
" Plugin Specific
" ###########################################################################

" fatih/vim-go
" Use goimports in place of gofmt
let g:go_fmt_command = "goimports"
