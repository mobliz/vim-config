" Pathogen (default dir = bundle)
call pathogen#infect()

" -- General -- "

" Map leader to ,
let mapleader=","

" Disable vi compatibility
set nocompatible

" Syntax highlighting
syntax on

" Indentation & backspace
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab smarttab autoindent
set backspace=indent,eol,start

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
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Show margin
if exists('+colorcolumn')
    set colorcolumn=80
    " Longer lines for Java
    au FileType java set colorcolumn=120
    highlight ColorColumn ctermbg=239
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
hi StatusLine ctermbg=245 ctermfg=239
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

" Temporarily clear search hilights
nnoremap å :noh<return><esc>

" Strip all trailing whitespace in the current file
nnoremap <leader>W mz:%s/\s\+$//<cr>:let @/=''<cr>'z

" Move by screen lines instead of file line.
nnoremap j gj
nnoremap k gk

" Toggle pastemode easily in insert and command mode
set pastetoggle=<F2>

" Line numbers toggle
nnoremap <F3> :set number!<cr>

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
