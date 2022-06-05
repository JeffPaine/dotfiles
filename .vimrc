" ###########################################################################
" .vimrc
" Author: Jeffrey Paine
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
Plugin 'vim-syntastic/syntastic'         " Syntax checking.
Plugin 'Raimondi/delimitMate'            " Bracket (etc.) matching / closing.
Plugin 'tpope/vim-surround'              " Easily add, subtract quotes / parentheses, etc
Plugin 'tpope/vim-repeat'                " Enable repeating (e.g. using '.') in supported plugins.
Plugin 'vim-airline/vim-airline'         " A nice statusline
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
  Plugin 'google/vim-maktaba' " required by google/vim-codefmt.
  Plugin 'google/vim-codefmt'
  Plugin 'google/vim-glaive'  " Used to configure codefmt's maktaba flags. See `:help :Glaive` for usage.
endif

" All of your Plugins must be added before the following line
call vundle#end()
" Put your non-Plugin stuff after this line

" Enable https://github.com/google/vim-glaive.
call glaive#Install()

" ###########################################################################
" General
" ###########################################################################

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

" Highlight the current line.
set cursorline

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
set listchars=trail:-,extends:>,precedes:<,nbsp:+,tab:▸\ ,eol:¬,space:␣

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

" Fix the 1s delay in Insert mode between pressing Escape and vim actually
" leaving Insert mode:
"
" timeoutlen = The delay to wait for successive vim keycodes entered by a
" human. Such keycodes should not include <Esc> unless intentionally added. To
" see any mappings in Insert mode that include the escape keycode: :imap <Esc>
"
" ttimeoutlen = The delay to wait for successive vime keycodes sent by a
" terminal. Such keycodes could include <Esc> depending on the Terminal. This
" would only need to be long if we had a really slow terminal or system.
"
" More info:
"   * https://vi.stackexchange.com/questions/10249/what-is-the-difference-between-mapped-key-sequences-and-key-codes-timeoutl
"   * https://vi.stackexchange.com/questions/24925/usage-of-timeoutlen-and-ttimeoutlen
set timeoutlen=1000
set ttimeoutlen=10

" Custom colorscheme.
colorscheme molokai

" Set background to be completely black (not just mostly-black as molokai sets it).
"
" Plugins are loaded after .vimrc is processed, which means the settings from
" ~/.vim/bundle/molokai/colors/molokai.vim override the custom color settings (highlight...) from
" .vimrc. So, we either have to add this override to ~/.vim/after/plugin/molokai/molokai.vim (which
" is annoying to maintain), or add it as a augroup.
augroup CustomColors
  autocmd!
  autocmd ColorScheme molokai highlight Normal ctermbg=Black
  autocmd ColorScheme molokai highlight nonText ctermbg=Black
augroup END

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

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Vertically center searched-for text on screen.
nnoremap n nzz
nnoremap N Nzz

" Easy navigation on wrapped lines.
nnoremap j gj
nnoremap k gk

" Don't move to the next instance of a string when highlighting all matches.
nnoremap * *``

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

" Quick quit all buffers.
nnoremap <leader>Q :qall<CR>

" Open a file in a new tab, and change to that tab.
nnoremap <leader>t Tqgt

" Quick hide search highlighting.
nnoremap <leader>n :nohlsearch<CR>

" Quick select all text.
nnoremap <leader>a ggVG<CR>

" Copy to system copy-paste buffer.
vnoremap <leader>c "+y<CR>

" Reload .vimrc.
nnoremap <leader>r :source $MYVIMRC<CR>

" Quickly enter/exit paste mode.
" nnoremap <leader>p :set paste<CR>
" nnoremap <leader>np :set nopaste<CR>
" set pastetoggle=<F4>

" Do not show stupid q: window
map q: :q

" Change tabs conveniently.
noremap <C-Tab> gt
noremap <C-n> gt
noremap <C-p> gT

" Open a new tab at the end of all current tabs.
noremap <C-t> :$tabnew<CR>

" Move to start / end of lines more conveniently.
nnoremap <C-a> ^
vnoremap <C-a> ^
nnoremap <C-e> $
vnoremap <C-e> $

" ###########################################################################
" Plugin specific
" ###########################################################################

" https://github.com/ycm-core/YouCompleteMe.
"
" Auto-close function signature pane after insertion.
let g:ycm_autoclose_preview_window_after_insertion=1
" Disable automatic pop-ups on hover:
" https://github.com/ycm-core/YouCompleteMe#the-gycm_auto_hover-option
let g:ycm_auto_hover=''

" https://github.com/scrooloose/nerdtree.
"
" Quick show NERDTree.
nnoremap <leader>nt :NERDTree<CR>

" https://github.com/vim-syntastic/syntastic
"
" Since we use https://github.com/vim-airline/vim-airline, per :h
" syntastic-airline, we should not set a custom statusline, as airline will
" take care of it for us.
"
" :h syntastic_mode_map
" 'In active mode, automatic checks are not done for
" any filetypes in the 'passive_filetypes' array ("active_filetypes" is
" ignored).'
"
" * python: passive because it's slow
" * c, cpp: passive because YouCompleteMe does it's own checking, :h syntastic-ycm
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["python", "c", "cpp"] }
" You can tell syntastic which checkers to run for a given filetype by setting
" a variable 'g:syntastic_<filetype>_checkers' to a list of checkers. More
" info: :h syntastic-filetype-checkers
"
" You can customize the flags passed to a syntastic checker, by setting a
" specialliy named variable like `syntastic_<filetype>_<checker>_<option>`.
" More info: :h syntastic-config-makeprg
"
" For linting go code we use the `golangci-lint` tool which itself supports
" running multiple linters: https://github.com/golangci/golangci-lint.
let g:syntastic_go_checkers = ['golangci_lint']
" Run all syntastic checkers and display their findings together. For more
" info see :h syntastic-aggregating-errors.
let g:syntastic_aggregate_errors = 1
" The below flags are documented at:
" https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
"
" By default syntastic doesn't fill the |location-list| with the errors found by
" the checkers, in order to reduce clashes with other plugins. Enable this
" option to tell syntastic to always stick any detected errors into the
" |location-list|.
let g:syntastic_always_populate_loc_list = 1
" When set to 1 the error window will be automatically opened when errors are
" detected, and closed when none are detected.
let g:syntastic_auto_loc_list = 1
" If this variable is enabled, syntastic in active mode will run syntax checks
" when buffers are first loaded, as well as on saving.
let g:syntastic_check_on_open = 1
" In active mode syntax checks are normally run whenever buffers are written to
" disk, even when the writes happen just before quitting Vim. If you want to
" skip checks when you issue `:wq`, `:x`, and `:ZZ`, set this variable to 0.
let g:syntastic_check_on_wq = 0
" Lint a file.
nnoremap <leader>l :SyntasticCheck<CR>

" https://github.com/Raimondi/delimitMate
" Auto expand enclosing brackets, etc. in insert mode on <CR>. e.g.:
"
" foo {}
"
" foo {
"
" }
let delimitMate_expand_cr=1

" https://github.com/google/vim-codefmt
"
if !filereadable(expand('~/.at_work.vimrc'))
  augroup autoformat_settings
    " If there's already an augroup of the same name, delete it. Otherwise, it
    " will be run more than once.
    " https://learnvimscriptthehardway.stevelosh.com/chapters/14.html
    autocmd!
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType html,css,json AutoFormatBuffer js-beautify
    autocmd FileType python AutoFormatBuffer yapf
    " autocmd FileType python AutoFormatBuffer autopep8
    " autocmd FileType dart AutoFormatBuffer dartfmt
    " autocmd FileType gn AutoFormatBuffer gn
    " autocmd FileType java AutoFormatBuffer google-java-format
  augroup END
endif
" Set a custom Go formatter.
" More info: :h codefmt:gofmt_executable
Glaive codefmt gofmt_executable='goimports'
" Set the clang format style.
Glaive codefmt clang_format_style="{BasedOnStyle: Google, DerivePointerAlignment: false}"
" Format a file.
nnoremap <leader>f :FormatCode<CR>

" https://github.com/tpope/vim-commentary
"
" Prefer c++ comments like // instead of /* */.
autocmd FileType cpp setlocal commentstring=//%s

" https://github.com/vim-airline/vim-airline
"
" Fix tmux pane alignment issues:
" https://github.com/vim-airline/vim-airline/issues/1745.
let g:airline_powerline_fonts = 0
let g:airline_symbols_ascii = 1


" ###########################################################################
" Miscellaneous
" ###########################################################################

" Automatically leave paste mode after exiting insert mode,
" (wrapped in an augroup in case .vimrc gets reloaded).
augroup paste
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

" ###########################################################################
" Filetype specific
" ###########################################################################

" From http://vimcasts.org/episodes/tabs-and-spaces/:
"
" * tabstop: specifies the visually displayed width of a tab character
" * expandtab: when enabled, causes spaces to be used in place of tab characters
" * softtabstop: fine tunes the amount of whitespace to be inserted
" * shiftwidth: the amount of whitespace to insert or remove when using the
"   indentation commands in Normal mode
"
" In general, it's best to have softtabstop == shiftwidth so that you get
" consistent behavior when shifting in Normal mode (e.g. << or >>) or when
" you're inserting or removing spaces with the tab and backspace keys.
"
" If you prefer to work with tab characters then it is a good idea to ensure
" that tabstop == softtabstop. This makes it less likely that you’ll end up
" with a mixture of tabs and spaces for indentation.
"
" If you prefer to work with spaces, then it is preferable to ensure that
" softtabstop == shiftwidth. This way, you can expect the same number of
" spaces to be inserted whether you press the tab key in insert mode, or use
" the indentation commands in normal/visual modes.

" Go / golang
autocmd Filetype go setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 noexpandtab

" HTML
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 textwidth=120 expandtab

" Markdown
" Assume markdown syntax for all .md files (not modula-2).
" BufNewFile = When starting to edit a file that doesn't exist.
" BufRead = When starting to edit a new buffer, after reading the file into the buffer, before executing the modelines.
autocmd BufNewFile,BufRead *.md set filetype=markdown|set textwidth=0

" C++
autocm Filetype cpp setlocal tabstop=2 shiftwidth=2 expandtab

" YAML
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" 'This will enable all the plugins. This line needs to happen after all of the
" plugin files have been added to your runtimepath. If it happens too early,
" certain plugin files may be ignored. It's easiest to just put it at the end of
" your vimrc and forget about it.'
filetype plugin indent on

" Enable syntax highlighting
syntax enable
