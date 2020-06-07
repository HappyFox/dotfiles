"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Installation :  https://github.com/junegunn/vim-plug#neovim
call plug#begin(stdpath('data') . '/plugged')

Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iCyMind/NeoSolarized'

call plug#end()

"ALE stuff
let g:ale_linters = {
\   'javascript': ['standard'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['standard'],
\   'python': ['black'],
\}

let g:ale_fix_on_save = 1

"Airline
let g:airline#extensions#tabline#enabled = 1


"deoplete sections in case I add it back.

"let g:deoplete#enable_at_startup = 1

"if !exists('g:deoplete#omni#input_patterns')
" let g:deoplete#omni#input_patterns = {}
"endif

" deoplete tab-complete
" autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Required:
filetype plugin indent on
syntax enable

set backspace=2 " allow backspacing of everything, including \n

tnoremap <Esc> <C-\><C-n>
set ts=4 " set tabstop to 4
set shiftwidth=4 " also set shiftwidth to 4
set expandtab " expand tabs to spaces
set softtabstop=4 " when you hit tab in insert mode.

set ruler
set textwidth=78
set spell

set guioptions-=T
syn on
set nowrap
set nu
set showcmd
set showmatch
set ignorecase
set smartcase
set showmode
set incsearch
set smartindent
set colorcolumn=80

set guifont=menlo\ 11
set termguicolors

set tags=tags;/

autocmd BufWritePre *.py :%s/\s\+$//e

set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}

map <Leader>s :lopen<CR>
map <Leader>S :lclose<CR>

set background=dark
colorscheme NeoSolarized
