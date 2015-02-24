execute pathogen#infect()

set nocompatible
set backspace=2 " allow backspacing of everything, including \n
set ts=4 " set tabstop to 3
set shiftwidth=4 " also set shiftwidth to 3
set expandtab " expand tabs to spaces
set softtabstop=4
set ruler
set textwidth=78
set spell

colorscheme slate

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
set guifont=menlo\ 11
set tags=tags;/ 
filetype plugin on        
autocmd BufWritePre *.py :%s/\s\+$//e

"Set pylint as the make command for python files
autocmd FileType python set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
autocmd FileType python set errorformat=%f:%l:\ %m

"Syntastic stuff
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers = ['pyflakes']

"Close NERDTree if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
