" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
" Bundle 'kien/ctrlp.vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}

filetype plugin indent on

set t_Co=256
syntax on
colors zenburn
set guioptions-=T
set encoding=utf8
set ffs=unix,dos,mac
set nobackup

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set ruler

autocmd FileType text setlocal textwidth=78
autocmd FileType html,css,xml,htmldjango setlocal shiftwidth=2
    \ tabstop=2

set incsearch
set ignorecase
set smartcase
set hlsearch
" premi \q per cancellare l'highlight della ricerca!
:nmap \q :nohlsearch<CR>

set lazyredraw

set showmatch

set noerrorbells
set novisualbell
set t_vb=


" TODO usare il comando "directory" per non avere i .swp in mezzo alle scatole
" guardare sensible.vim
set mouse=a


" chiudi vim se l'unica finestra è NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" :nmap \e :NERDTreeToggle<CR>
map <Leader>e <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

" moving around tabs: http://vim.wikia.com/wiki/VimTip1221
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Left> <Esc>:tabprevious<CR>i
inoremap <C-Right> <Esc>:tabnext<CR>i
nnoremap <C-t> :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" http://stackoverflow.com/questions/1919028/how-to-show-vertical-line-to-wrap-the-line-in-vim
set colorcolumn=80
