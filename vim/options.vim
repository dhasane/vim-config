
" #########################
" general
" #########################

" packadd termdebug

set t_Co=256

" autocmd BufNewFile * silent! call LoadTemplate('%:e') " cargar templates

if has('persistent_undo')
    set undodir=$HOME/.vim/undo
    set undolevels=10000
    set undofile
endif

set ruler

if &compatible
  set nocompatible
endif

set path+=.**
set spellsuggest=10 " muestra las primeras 10 palabras recomendadas

" Where to look for tags files
set tags=~/.config/nvim/tags
"command! MakeTags !ctags -R .

" esto arregla el problema de C-direccion para tmux
if exists('$TMUX')
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

filetype plugin on
syntax on
syntax enable

" scriptencoding utf-8
" set enc=utf-8
" set fileencoding=utf-8
" set fileencodings=ucs-bom,utf8,prc

"enables codefolding"
" set foldmethod=indent
" set foldnestmax=10
" set foldcolumn=2
" set nofoldenable
" set foldlevel=1
" highlight Pmenu guibg=#e77171 gui=bold

set encoding=utf-8

set path+=.**
set wildmenu
set wildmode=list:longest,list:full

" set list listchars=tab:-\ \,trail:¬∑ "set points after
set list listchars=tab:»·,trail:·  " configuracion cool que encontre para mostrar espacios al inicio y al final de la linea

set splitbelow
set splitright

set linebreak
set breakindent
set showbreak=\
set smarttab  "Improves tabbing
set expandtab " Use spaces instead of tabs
set tabstop=4  "How much space Vim gives to a tab

set shiftwidth=4  "Assists code formatting

set backspace=2  "This makes the backspace key function like it does in other programs.

set smartindent  "Automatically indents lines after opening a bracket in programming languages
set autoindent  "If you're indented, new lines will also be indented
set copyindent

set showmatch "Highlights matching brackets in programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set go=a

set foldmethod=manual  "Lets you hide sections of code
" set foldmethod=indent  "Lets you hide sections of code

set clipboard=unnamedplus  " en para el clipboard, en teoria

" busqueda
set ignorecase " make searches case insensitive
set hlsearch  " highlight matching search strings

set completeopt=menuone
set completeopt+=preview

let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 25

" tamaño minimo de una vista
set winheight=25
set winwidth=90
" TODO winlayout suena interesante
" ['row', [['col', [['leaf', 1115], ['leaf', 1111]]], ['leaf', 1114]]]

" Better display for messages
set number relativenumber
set scrolloff=10 " keep some lines visible when scrolling
set cursorline " cambia el color de la linea en la que se encuentra el cursor

" always show signcolumns
set signcolumn=yes

" set completeopt+=preview
set completeopt+=menu,longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
