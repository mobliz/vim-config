" Disable vi compatibility
set nocompatible

" -- Vundle -- "
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle bundle
Bundle 'gmarik/vundle'

" Plugins
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'dahu/Insertlessly'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tomtom/tcomment_vim'
Bundle 'maxbrunsfeld/vim-yankstack'

" Color themes
Bundle 'altercation/vim-colors-solarized'
Bundle 'jacekd/vim-iawriter'
Bundle 'morhetz/gruvbox'

" -- General -- "

" Show filename in title and revert after exit
set title
set titleold=""
set titlestring=VIM:\ %F

" Syntax highlighting
syntax on

" Indentation & backspace
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab smarttab autoindent
set backspace=2

" Filetype
filetype on
filetype plugin on

" Makefiles and gitconfig require tab
au FileType make,gitconfig setlocal noexpandtab

" Bash-like tab completion for vim commands
set wildmode=longest,list,full

" Hidden buffers
set hidden

" -- Appearance -- "

" Color scheme
set background=dark
colorscheme solarized

if exists('g:colors_name') && g:colors_name == 'solarized'
    call togglebg#map('<F4>')
endif

" Show margin
if exists('+colorcolumn')
    set colorcolumn=80
    " Longer lines for Java
    au FileType java set colorcolumn=120
    highlight ColorColumn ctermbg=10
else
    " Fallback
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    au FileType java au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Show trailing whitespace characters
set list
set listchars=tab:▸—,trail:·,extends:…,nbsp:␣

" Display line numbers
set number

" Improves redrawing
set ttyfast

" Display filename in window title
set titlestring=%f title

" Highlight current line
set cursorline

" Statusline
set laststatus=2
hi StatusLine ctermbg=0 ctermfg=10
set statusline=%F%m%r%h%w\
set statusline+=%y\
set statusline+=%{fugitive#statusline()}\
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]
set statusline+=%=
set statusline+=[col\ %c]

" -- Search -- "

" Hilight searches & search incrementally
set hlsearch
set incsearch

" Searches are case-insensitive, unless they contain upper-case letters
set ignorecase
set smartcase

" -- Key Mappings -- "

" Yankstack configuration
let g:yankstack_map_keys = 0
call yankstack#setup()
map <C-p> <Plug>yankstack_substitute_older_paste
map <C-n> <Plug>yankstack_substitute_newer_paste

" Map leader to ,
let mapleader=","

" Map ctrlp
let g:ctrlp_map = '<Leader>t'
map <Leader>T :CtrlPClearAllCaches<cr>

" Temporarily clear search hilights
nnoremap å :noh<cr><esc>

" Strip all trailing whitespace in the current file
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>'z

" Toggle pastemode easily in insert and command mode
set pastetoggle=<F2>

" Always disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Line numbers toggle
nnoremap <F3> :set number!<cr>

" Navigation keys

" Move by screen lines instead of file line.
nnoremap j gj
nnoremap k gk

" First non whitespace character
map ö ^

" End of line
map ä $

" Beginning of line
map Ö 0

" Last non space character
map Ä g_

" Same for visual mode
vmap ö ^
vmap ä $
vmap Ö 0
vmap Ä g_

" -- Directories -- "

" Enable backup, set directories for swap and backup files
" // in the end of paths means build from complete path
set backup
set backupdir=~/.vim/tmp/backup//
set dir=~/.vim/tmp/swap//

" Enable persistent undo
if version >= 703
    set undodir=~/.vim/undo//
    set undofile
    " Maximum number of changes that can be undone
    set undolevels=1000
    " Maximum number lines to save for undo on a buffer reload
    set undoreload=10000
endif
