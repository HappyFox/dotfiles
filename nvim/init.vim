"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/root/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/root/.config/nvim/')
  call dein#begin('/root/.config/nvim/')

  " Let dein manage dein
  " Required:
  call dein#add('/root/.config/nvim/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')

  call dein#add('ervandew/supertab')

  call dein#add('neomake/neomake')
  call dein#add('altercation/vim-colors-solarized')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1
"if !exists('g:deoplete#omni#input_patterns')
" let g:deoplete#omni#input_patterns = {}
"endif


" let g:deoplete#disable_auto_complete = 1
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
autocmd FileType python let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" augroup omnifuncs
"   autocmd!
"   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" augroup End


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
set backspace=2 " allow backspacing of everything, including \n


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
autocmd! BufWritePost * Neomake

set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}


let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \ }
let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \ }


let g:neomake_open_list = 2

set background=dark
colorscheme solarized
"hi ColorColumn ctermbg=darkblue
"hi SpellBad cterm=NONE ctermbg=blue ctermfg=white
"hi Error cterm=NONE ctermbg=1 ctermfg=7