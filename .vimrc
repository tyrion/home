" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'kien/ctrlp.vim'
" Plugin 'SirVer/ultisnips'
Plugin 'othree/eregex.vim'
Plugin 'hylang/vim-hy'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
" Plugin 'edkolev/promptline.vim'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on

set t_Co=16
syntax on
set background=dark
colors solarized
set guioptions-=T
set encoding=utf8
set ffs=unix,dos,mac

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent

set ruler

autocmd FileType text setlocal textwidth=78
autocmd FileType html,xhtml,css,scss,xml,htmldjango,eruby,ruby,javascript
    \ setlocal shiftwidth=2 tabstop=2

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

set mouse=a
set ttymouse=xterm2 " Fixes drag and drop in tmux.

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

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:tmuxline_separators = {
    \ 'left_alt': ''}

set pastetoggle=<F10>

" http://stackoverflow.com/questions/7342441/how-would-i-have-vim-highlight-redundant-white-space-and-all-tabs
" match Error /\s\+$\|\t/
" highlight RedundantWhitespace ctermbg=red guibg=red

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set directory=$HOME/.vim/swapfiles//
set undodir=$HOME/.vim/undo
set undofile
set nobackup
