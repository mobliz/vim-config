" Pathogen (default dir = bundle)
call pathogen#infect()

" Syntax highlighting
syntax on

" Color scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Disable vi compatibility
set nocompatible

" Indentation & backspace
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab smarttab autoindent
set backspace=indent,eol,start

" Show margin
if exists('+colorcolumn')
    set colorcolumn=80
    " Longer lines for Java
    au FileType java set colorcolumn=120
    highlight ColorColumn ctermbg=8
endif

" Hilight searches & search incrementally
set hlsearch
set incsearch

" Searches are case-insensitive, unless they contain upper-case letters
set smartcase

" Temporarily clear search hilights
nnoremap å :noh<return><esc>

" Move by screen lines instead of file line. Nice with long lines.
nnoremap j gj
nnoremap k gk

" Toggle pastemode easily in insert and command mode
set pastetoggle=<F2>

" Line numbers toggle (default on)
set number
nnoremap <F3> :set number!<CR>

" Show trailing whitespace characters
set list
set listchars=tab:▸—,trail:·,extends:…,nbsp:␣

" Bash-like tab completion for vim commands
set wildmode=longest,list,full

" Hide buffers
set hidden

" Enable backup, set directories for swap and backup files
" // in the end of paths means build from complete path
set backup
set backupdir=~/.vim/tmp/backup//
set dir=~/.vim/tmp/swap//
