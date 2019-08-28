"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein/')
  call dein#begin('~/.cache/dein/')
 
  call dein#add('~/.cache/dein')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('neomake/neomake')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('psf/black')

  " Required:
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
 let g:deoplete#omni#input_patterns = {}
endif



" deoplete tab-complete
" autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
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

set tags=tags;/ 

autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.py execute ':Black'

set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}

let g:neomake_python_exe = 'python3'

let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }
let g:neomake_info_sign = {
  \ 'text': 'I',
  \ 'texthl': 'InfoMsg',
  \ }

"let g:neomake_open_list = 2
call neomake#configure#automake('nrw', 1000)

map <Leader>s :lopen<CR>
map <Leader>S :lclose<CR>

set background=dark
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termcolors = 16
colorscheme solarized
