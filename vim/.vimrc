
set number
set relativenumber
set ruler
set cursorline

highlight CursorLine cterm=NONE ctermbg=236 guibg=#444444
highlight CursorLineNr cterm=NONE ctermfg=11 guibg=#3b3b3b gui=bold guifg=Yellow

set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent


set incsearch
set hlsearch
set ignorecase
set smartcase
set shortmess-=S

set mouse=a
set clipboard=unnamed

syntax on



let mapleader = " "
nnoremap <leader>w :w<CR>

" ========== Drew Neil's Practical VIM ==========
nnoremap <Left> :echo "Use h !!!"<CR>
nnoremap <Right> :echo "Use l !!!"<CR>
nnoremap <Up> :echo "Use k !!!"<CR>
nnoremap <Down> :echo "Use j !!!"<CR>

" Better VIM scroll
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz
nnoremap DD ""dd
nnoremap ss :noh<CR>
" ===============================================

com! FormatJSON %!python3 -m json.tool


