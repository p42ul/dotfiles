""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The basics
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set encoding=utf-8

let mapleader=" " " Use spacebar as <Leader>
set nocompatible " This is Vim, not Vi
filetype plugin indent on " Enable filetype detection, plugin loading, indenting
syntax enable " Enable syntax highlighting

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When pressing enter, clear search highlighting and close Preview window
nnoremap <CR> :noh<CR>:pclose<CR><CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle (p)aste
nnoremap <Leader>p :set paste!<CR>
" (e)dit file in same directory as current buffer
nnoremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Kill buffer and close (w)indow
nnoremap <Leader>w :bd<CR>
" Kill buffer without closing (W)indow
nnoremap <Leader>W :BD<CR>
" Create a new (t)ab
nnoremap <Leader>t :tabnew<CR>
" (h)ead left in the tab list
nnoremap <Leader>h gT
" (l)eap right in the tab list
nnoremap <Leader>l gt<CR>
" (j)ump down in the file list
nnoremap <Leader>j :bn<CR>
" (k)limb up in the file list
nnoremap <Leader>k :bp<CR>

" Toggle the (u)ndo tree
nnoremap <Leader>u :UndotreeToggle<CR>

" Toggle the (n)erd (file explore) tree
nnoremap <Leader>n :NERDTreeToggle<CR>

" Toggle (c)olumn highlighting
nnoremap <Leader>c :set cursorcolumn!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basics.
set number        " Turn line numbers on
set mouse=a       " Enable the x-y tracking device
set cursorline    " Underline where cursor is
set backspace=2   " Backspace deletes like most programs in insert mode

" Swap and backup files.
set nobackup
set nowritebackup
set noswapfile    " Don't keep a swap file.

" Visuals.
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set hlsearch      " highlight search results
set laststatus=2  " Always display the status line
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace.

if has("gui_running") " Set font for, e.g., gVim
  set guifont=Consolas:h12
endif

if exists('g:neovide') " Neovide-specific options
  nnoremap <F11> :let g:neovide_fullscreen = !g:neovide_fullscreen<CR>
endif

set tabstop=4     " Set the width of a tab character to 4 spaces
set shiftwidth=4
set softtabstop=4
set expandtab     " Convert tabs to spaces

" Enhancements.
set autowriteall          " Automatically :write before running commands
set smarttab              " Make the tab key insert spaces or tabs to go to next indent
set history=10000           " remember 10000 years ago
set wildmenu              " Show a menu when tab-completing commands.

" Searching.
set ignorecase    " Do case-insensitive searching...
set smartcase     " ...unless the search contains capital letters
set incsearch     " do incremental searching

" Compatability.
if &term =~ "xterm" " Fix for cursor block in WSL.
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[3 q"
    let &t_EI = "\<Esc>[2 q"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin($HOME . '/.vim/plugged')
""""""""""""""""""""""""""""""""""""

Plug 'christoomey/vim-tmux-navigator' " Seamless tmux and vim pane navigation.
Plug 'jceb/vim-hier' " Highlight quickfix entries.
Plug 'jpalardy/vim-slime' " Send text to a REPL, tmux pane, etc.
  let g:slime_target = "tmux"
Plug 'mbbill/undotree' " UndoTree, visualizes Vim's undo tree.
Plug 'nathanaelkane/vim-indent-guides' " Indentation guides.
Plug 'jnurmine/Zenburn' " Zenburn colorscheme
Plug 'phanviet/vim-monokai-pro' " TextMate colorscheme.
Plug 'qpkorr/vim-bufkill' " Delete buffers without closing splits.
Plug 'scrooloose/nerdtree' " Browse filesystem nicely.
Plug 'tpope/vim-commentary' " Comment stuff out.
Plug 'tpope/vim-eunuch' " Rename, Move, Delete, etc.
Plug 'tpope/vim-sleuth' " Autodetect shiftwidth and tabs n stuff.
" Disabled because it requires Python-compatible Vim
" If you have it, it can be useful!
" Plug 'Yggdroot/LeaderF'
"   let g:Lf_WindowPosition = 'popup'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual style
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set termguicolors " Use 24-bit color.
colorscheme zenburn
set t_ut=    " http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Additional sources
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vimrc_local = $HOME . '/.vimrc.local'
if filereadable(s:vimrc_local)
    execute 'source ' . s:vimrc_local
endif
