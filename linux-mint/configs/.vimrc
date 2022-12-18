" disable compatibility with vi which can cause errors
set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on

set number
set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set scrolloff=10
set nowrap

" search settings
set incsearch
set ignorecase
set smartcase
set history=1000

" wildmenu stuff
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx 

" hopefully this will make things faster
set timeout ttimeout
set timeoutlen=500
set ttimeoutlen=20

" plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'townk/vim-autoclose'
call plug#end()

autocmd vimenter * ++nested colorscheme

set bg=dark
let g:gruvbox_italic='1'
let g:gruvbox_contrast_dark='medium'

colorscheme gruvbox
