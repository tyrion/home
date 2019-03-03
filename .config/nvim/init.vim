nnoremap ; :
let mapleader="\<SPACE>"

set clipboard+=unnamedplus
set mouse=a

set hidden
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent
set smartindent
set showmatch
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

set ffs=unix,dos,mac

autocmd FileType text setlocal textwidth=78
autocmd FileType html,xhtml,css,scss,xml,htmldjango,eruby,ruby,javascript
    \ setlocal shiftwidth=2 tabstop=2

set colorcolumn=80
set pastetoggle=<F10>

" https://askubuntu.com/questions/1059663/remapping-caps-lock-to-escape-in-ubuntu-18-04-bionic
" https://stackoverflow.com/questions/2176532/how-to-map-caps-lock-key-in-vim
" au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
" au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set undofile

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ambv/black'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'kien/ctrlp.vim'

" Autocomplete
" https://github.com/ncm2/ncm2
" https://jacky.wtf/weblog/language-client-and-neovim/
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" https://medium.com/@hanspinckaers/setting-up-vim-as-an-ide-for-python-773722142d1d
Plug 'ncm2/ncm2-jedi'

" https://github.com/palantir/python-language-server
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }
 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

call plug#end()

colors solarized

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'zenburn'

" https://vi.stackexchange.com/questions/4120/how-to-enable-disable-an-augroup-on-the-fly
let g:black_linelength = 79
let g:black_virtualenv = expand('$PYENV_ROOT/versions/3.7.2/')
autocmd BufWritePre *.py execute ':Black'

let NERDTreeIgnore = [
    \ '\.py[co]', '\.git[[dir]]', '__pycache__[[dir]]', '\.egg-info[[dir]]'
    \ ]
map <Leader>e :NERDTreeToggle<CR>

" call neomake#configure#automake('w')
call neomake#configure#automake('nw', 750)
let g:neomake_python_enabled_makers = ['python', 'mypy']
let g:neomake_python_mypy_args = [
    \ '--python-executable=' . expand('$PYENV_ROOT/shims/python')
    \ ]

" runs :lopen after neomake
" let g:neomake_open_list = 2

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "S",
    \ "Untracked" : "U",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "D",
    \ "Dirty"     : "M",
    \ "Clean"     : "C",
    \ 'Ignored'   : 'I',
    \ "Unknown"   : "?"
    \ }

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

nnoremap <Leader>o :CtrlPMixed<CR>

" Autocomplete
autocmd BufEnter *.py call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
" This will show the popup menu even if there's only one match (menuone),
" prevent automatic selection (noselect) and prevent automatic text injection
" into the current line (noinsert).
set completeopt=noinsert,menuone,noselect

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

let ncm2#complete_length = [[1, 1]]

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
" inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" let g:LanguageClient_serverCommands = {
"     \ 'python': [expand('~/.local/share/pyenv/shims/pyls')]
"     \ }

let g:mkdp_auto_close = 1
