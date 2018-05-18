execute pathogen#infect()

set nocompatible
set backspace=2 " allow backspacing of everything, including \n

set ts=4 " set tabstop to 4
set shiftwidth=4 " also set shiftwidth to 4
set expandtab " expand tabs to spaces
set softtabstop=4 " when you hit tab in insert mode. 

set ruler
set textwidth=78
"set spell

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
set autoindent
set colorcolumn=80


set guifont=menlo\ 11

set tags=tags;/ 

filetype plugin on        
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd QuickFixCmdPost * :copen


set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \ @%{strftime(\"%H:%M:%S\")}

"Syntastic stuff
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pep8', 'pylint']

"Close NERDTree if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <F1> :NERDTreeToggle<CR>
map <F2> :set spell!<CR>
map <F7> :make<CR>
map <F8> :make test<CR>
map <F9> :make repl<CR>
map <Leader>s :lopen<CR>
map <Leader>S :lclose<CR>

set background=dark
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
let g:solarized_termcolors = 16
colorscheme solarized
"hi ColorColumn ctermbg=blue
"hi SpellBad cterm=NONE ctermbg=blue ctermfg=white
"hi Error cterm=NONE ctermbg=1 ctermfg=7
