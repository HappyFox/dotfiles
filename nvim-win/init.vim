call plug#begin('~/AppData/Local/nvim/plugged')
" below are some vim plugin for demonstration purpose
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'neomake/neomake'
Plug 'joshdick/onedark.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'python/black'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

let g:python3_host_prog = 'C:\Python37\python.exe'
call deoplete#enable()

" Required:
filetype plugin indent on
syntax enable


autocmd BufWritePre *.py execute ':Black'

" deoplete tab-complete
 autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

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

set tags=tags;/ 

autocmd BufWritePre *.py :%s/\s\+$//e

set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}



map <Leader>s :lopen<CR>
map <Leader>S :lclose<CR>

set background=dark
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"let g:solarized_termcolors = 16
"colorscheme solarized
colorscheme NeoSolarized
