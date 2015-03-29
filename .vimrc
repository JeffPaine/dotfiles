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

" A nice colorscheme
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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

" Set no line length by default
set textwidth=0

" Wrap text by default
set wrap

" Don't break text in the middle of a word, roughly.
" More specifically, only break at a character in breakat.
set linebreak

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

" Create .swp files in single, non-intrusive place.
" The // tells vim to store .swp files in a way that files with the same
" name won't conflict.
if !isdirectory($HOME."/.vim/backup")
    call mkdir($HOME."/.vim/backup", "p")
endif
set backupdir=$HOME/.vim/backup//

if !isdirectory($HOME."/.vim/swap")
    call mkdir($HOME."/.vim/swap", "p")
endif
set directory=$HOME/.vim/swap//

if !isdirectory($HOME."/.vim/undo")
    call mkdir($HOME."/.vim/undo", "p")
endif
set undodir=$HOME./.vim/undo//

" ###########################################################################
" Keybindings
" ###########################################################################

" Make window splitting shortcuts memorable.
map <C-w><bar> <C-w>v
map <C-w>- <C-w>s

" ###########################################################################
" Filetype Specific
" ###########################################################################

" Python file only settings
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4

" Markdown
" Assume markdown syntax for all .md files (not modula-2)
autocmd BufNewFile,BufRead *.md set filetype=markdown
" BufNewFile = When starting to edit a file that doesn't exist.
" BufRead = When starting to edit a new buffer, after reading the file into the
" buffer, before executing the modelines.

" ###########################################################################
" Plugin Specific
" ###########################################################################

" fatih/vim-go
" Use goimports in place of gofmt
let g:go_fmt_command = "goimports"
