" ###########################################################################
" .vimrc
" Author: Jeff Paine
" ###########################################################################

" Disables vi compatibility
set nocompatible

" ###########################################################################
" Vundle
" ###########################################################################

" Required to setup vundle
filetype off

" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'               " let Vundle manage Vundle, required
Plugin 'fatih/vim-go'                    " Go-specific helpers.
Plugin 'scrooloose/syntastic'            " Syntax checking.
Plugin 'Raimondi/delimitMate'            " Bracket (etc.) matching / closing.
Plugin 'tpope/vim-surround'              " Easily add, subtract quotes / parentheses, etc
Plugin 'tpope/vim-repeat'                " Enable repeating (e.g. using '.') in supported plugins.
Plugin 'bling/vim-airline'               " A nice statusline
Plugin 'ConradIrwin/vim-bracketed-paste' " Auto-enter paste mode when pasting.
Plugin 'godlygeek/tabular'               " Align text based on delimeters
Plugin 'tpope/vim-commentary'            " Easy [un]commenting of lines.
Plugin 'scrooloose/nerdtree'             " File explorer.
Plugin 'tomasr/molokai'                  " A nice color scheme.

" Some work-only settings.
if filereadable(expand('~/.at_work.vimrc'))
  source ~/.at_work.vimrc
else
  Plugin 'Valloric/YouCompleteMe'
endif

" All of your Plugins must be added before the following line
call vundle#end()
" Put your non-Plugin stuff after this line

" ###########################################################################
" General
" ###########################################################################

" Enable syntax highlighting
syntax enable

" This shows what you are typing in the status line.
set showcmd

" Show the current mode.
set showmode

" Enable autoindent
set autoindent

" Enable tab-completion in the vim command line
set wildmenu
set wildmode=list:longest,full

" Ignore case when completing file names
set wildignorecase

" Set our level of mouse support in the console
set mouse=

" Make backspace act like it does in other apps e.g. delete across line breaks,
" etc.
set backspace=2

" Make arrow and movement keys work across lines.
set whichwrap+=<,>,[,],h,l

" Show line numbers
set number

" Set no line length by default
set textwidth=0

" Wrap text by default
set wrap

" Indent wrapped text as needed.
set breakindent

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

" Every window always has a status line.
set laststatus=2

" " Add a custom status line.
" set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

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

" Only one space after a period when reflowing text.
set nojoinspaces

" No infernal beeping.
set noerrorbells

" No swap files.
set noswapfile

" Use 256 colors.
set t_Co=256

" Custom colorscheme.
colorscheme molokai

" Don't highlight matching parenthesis, braces, etc. (makes it hard to tell
" where the cursor is).
let g:loaded_matchparen=1

" ###########################################################################
" Keybindings
" ###########################################################################

" Make window splitting shortcuts memorable.
" | or \ for vertical split.
map <C-w><bar> <C-w>v
map <C-w>\ <C-w>v
" - for horizontal split.
map <C-w>- <C-w>s

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" The escape key is too far away
imap jj <Esc>

" Vertically center searched-for text on screen.
nnoremap n nzz
nnoremap N Nzz

" Easy navigation on wrapped lines.
nnoremap j gj
nnoremap k gk

" Re-highlight lines after shifting them.
vnoremap < <gv
vnoremap > >gv

" Custom leader for custom commands.
let mapleader = ","
let g:mapleader = ","

" Quick save.
nnoremap <leader>w :w<CR>

" Quick quit.
nnoremap <leader>q :q<CR>

" Quick hide search highlighting.
nnoremap <leader>n :nohlsearch<CR>

" Quick select all text.
nnoremap <leader>a ggVG<CR>

" Copy to system copy-paste buffer.
vnoremap <leader>c "+y<CR>

" Hide highlighted text.
nnoremap <leader>nn :nohlsearch<CR>

" Reload .vimrc.
nnoremap <leader>r :source $MYVIMRC<CR>

" Quickly enter/exit paste mode.
nnoremap <leader>p :set paste<CR>
nnoremap <leader>np :set nopaste<CR>
set pastetoggle=<F4>


" Change tabs conveniently.
noremap <C-n> gt
noremap <C-p> gT

" Open a new tab.
noremap <C-t> :tabnew<CR>

" Move to start / end of lines more conveniently.
nnoremap <C-a> ^
vnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-e> $

" ###########################################################################
" Filetype specific
" ###########################################################################

" Markdown
" Assume markdown syntax for all .md files (not modula-2)
autocmd BufNewFile,BufRead *.md set filetype=markdown|set textwidth=0
" BufNewFile = When starting to edit a file that doesn't exist.
" BufRead = When starting to edit a new buffer, after reading the file into the buffer, before executing the modelines.

" ###########################################################################
" Plugin specific
" ###########################################################################

" github.com/fatih/vim-go
" Turn on fmt-on-save.
let g:go_fmt_autosave = 1
" Use goimports as our auto-save fmt-er.
let g:go_fmt_command = "goimports"

" YouCompleteMe
" Auto-close function signature pane after insertion.
let g:ycm_autoclose_preview_window_after_insertion=1

" NERDTree.
" Quick show NERDTree.
nnoremap <leader>nt :NERDTree<CR>

" Open a file in a new tab, and change to that tab.
nmap <leader>t Tqgt

" Syntastic
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python"] }

" Raimondi/delimitMate
" Auto expand enclosing brackets, etc. in insert mode on <CR>. e.g.:
"
" foo {}
"
" foo {
"
" }
let delimitMate_expand_cr=1

" ###########################################################################
" Miscellaneous
" ###########################################################################

" 'This will enable all the plugins. This line needs to happen after all of the
" plugin files have been added to your runtimepath. If it happens too early,
" certain plugin files may be ignored. It's easiest to just put it at the end of
" your vimrc and forget about it.'
filetype plugin indent on
