set shell=/bin/bash

" --- Plugins

call plug#begin()

" GUI enhancements
Plug 'itchyny/lightline.vim'
" Plug 'andymass/vim-matchup'

" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" language server protocols
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()


" --- Completion

" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect
" Better display for messages
set cmdheight=2


" --- Editor settings

filetype plugin indent on
set autoindent
set timeoutlen=300 " https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=4
set noshowmode " remove -- INSERT --
set hidden " remove error for opening writing file
set nowrap
set nojoinspaces

" Use wide tabs
set shiftwidth=8
set softtabstop=8
set tabstop=8
set noexpandtab

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" TODO change it to other xdg variable
" Permanent undo
" set undodir=~/.vimdid
" set undofile

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault


" --- GUI settings

set guioptions-=T " Remove toolbar
set vb t_vb= " No more beeps
set backspace=2 " Backspace over newlines
set nofoldenable
set ttyfast
" https://github.com/vim/vim/issues/1735#issuecomment-383353563
set lazyredraw
set synmaxcol=500
set laststatus=2
set relativenumber " Relative line numbers
set number " Also show current absolute line
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
" disabled for mac
" set diffopt+=algorithm:patience
" set diffopt+=indent-heuristic
set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set shortmess+=c " don't give |ins-completion-menu| messages.
" au TextYankPost * silent! lua vim.highlight.on_yank() " Highlight yank

" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•


" --- Keyboard shortcuts

" Jump to start and end of line using the home row keys
map H ^
map L $

