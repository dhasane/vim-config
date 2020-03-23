
" NNNNNNNN        NNNNNNNNEEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO     VVVVVVVV           VVVVVVVVIIIIIIIIIIMMMMMMMM               MMMMMMMM
" N:::::::N       N::::::NE::::::::::::::::::::E   OO:::::::::OO   V::::::V           V::::::VI::::::::IM:::::::M             M:::::::M
" N::::::::N      N::::::NE::::::::::::::::::::E OO:::::::::::::OO V::::::V           V::::::VI::::::::IM::::::::M           M::::::::M
" N:::::::::N     N::::::NEE::::::EEEEEEEEE::::EO:::::::OOO:::::::OV::::::V           V::::::VII::::::IIM:::::::::M         M:::::::::M
" N::::::::::N    N::::::N  E:::::E       EEEEEEO::::::O   O::::::O V:::::V           V:::::V   I::::I  M::::::::::M       M::::::::::M
" N:::::::::::N   N::::::N  E:::::E             O:::::O     O:::::O  V:::::V         V:::::V    I::::I  M:::::::::::M     M:::::::::::M
" N:::::::N::::N  N::::::N  E::::::EEEEEEEEEE   O:::::O     O:::::O   V:::::V       V:::::V     I::::I  M:::::::M::::M   M::::M:::::::M
" N::::::N N::::N N::::::N  E:::::::::::::::E   O:::::O     O:::::O    V:::::V     V:::::V      I::::I  M::::::M M::::M M::::M M::::::M
" N::::::N  N::::N:::::::N  E:::::::::::::::E   O:::::O     O:::::O     V:::::V   V:::::V       I::::I  M::::::M  M::::M::::M  M::::::M
" N::::::N   N:::::::::::N  E::::::EEEEEEEEEE   O:::::O     O:::::O      V:::::V V:::::V        I::::I  M::::::M   M:::::::M   M::::::M
" N::::::N    N::::::::::N  E:::::E             O:::::O     O:::::O       V:::::V:::::V         I::::I  M::::::M    M:::::M    M::::::M
" N::::::N     N:::::::::N  E:::::E       EEEEEEO::::::O   O::::::O        V:::::::::V          I::::I  M::::::M     MMMMM     M::::::M
" N::::::N      N::::::::NEE::::::EEEEEEEE:::::EO:::::::OOO:::::::O         V:::::::V         II::::::IIM::::::M               M::::::M
" N::::::N       N:::::::NE::::::::::::::::::::E OO:::::::::::::OO           V:::::V          I::::::::IM::::::M               M::::::M
" N::::::N        N::::::NE::::::::::::::::::::E   OO:::::::::OO              V:::V           I::::::::IM::::::M               M::::::M
" NNNNNNNN         NNNNNNNEEEEEEEEEEEEEEEEEEEEEE     OOOOOOOOO                 VVV            IIIIIIIIIIMMMMMMMM               MMMMMMMM

" #########################
" general
" #########################

" para poder poner comandos mas interesantes sin sobreescribir nada :v
let mapleader = ","

" plugins
source ~/.config/nvim/plug.vim
packadd termdebug

" if &t_Co > 255
"     " color definitions
" endif
" if &t_Co == 8
"     " color definitions
" endif

if (has("termguicolors"))
  set termguicolors
endif

autocmd BufNewFile * silent! call LoadTemplate('%:e') " cargar templates

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

let comentario = ""

" let g:python_host_prog = "/usr/bin/python2"
" let g:python3_host_prog = "/usr/bin/python3"
if has('python3') " primera opcion
  set pyx=3
elseif has('python2') " segunda opcion
  set pyx=2
endif

" autocmd FileType c,cpp,vim,java,php,rust,python autocmd BufWritePre * :call StripEndlineComments()
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


" autocmd Filetype * &ft!="markdown" | BufWritePre * %s/\s\+$//e " quitar espacios ' ' sobrantes al final, excepto si es markdown

"quitar autocontinuacion de comentarios al pasar a la siguiente linea
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" augroup vimrc
"   au BufReadPre * setlocal foldmethod=indent
"   au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
" augroup END

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

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
set encoding=utf-8

set noswapfile

set linebreak

set list listchars=tab:»·,trail:·  " configuracion cool que encontre para mostrar espacios al inicio y al final de la linea

set breakindent
set smarttab  "Improves tabbing
set expandtab " Use spaces instead of tabs
set tabstop=4  "How much space Vim gives to a tab

set shiftwidth=4  "Assists code formatting

set backspace=2  "This makes the backspace key function like it does in other programs.

set smartindent  "Automatically indents lines after opening a bracket in programming languages
set autoindent  "If you're indented, new lines will also be indented

set showmatch "Highlights matching brackets in programming languages
set mouse=a  "Allows you to click around the text editor with your mouse to move the cursor
set go=a

set foldmethod=manual  "Lets you hide sections of code
" set foldmethod=indent  "Lets you hide sections of code

set clipboard=unnamedplus  " en para el clipboard, en teoria

" busqueda
set ignorecase " make searches case insensitive
set hlsearch  " highlight matching search strings

" set completeopt+=preview
" set completeopt+=menuone,preview

" tamaño minimo de una vista
set winheight=25
set winwidth=90

" #######################
" visual
" ######################

" cursor

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" de lo que supongo
" SI -> insert
" EI -> normal

let &t_SI = "\e[6 q"        " insert
let &t_SR = "\<Esc>[4 q"    " cosas como delete -> modify, supongo
let &t_EI = "\e[2 q"        " normal
if exists('$TMUX')
    let &t_SI = "\ePtmux;\e".&t_SI."\e\\"
    let &t_SR = "\ePtmux;\e".&t_SR."\e\\"
    let &t_EI = "\ePtmux;\e".&t_EI."\e\\"
endif

" Better display for messages
set laststatus=2    " mostrar la barra de status
set cmdheight=1
set number relativenumber
set noshowmode		" para no mostrar el estado de edicion en la ultima linea, ya que esta en lightline
set scrolloff=10 " keep some lines visible when scrolling
set cursorline " cambia el color de la linea en la que se encuentra el cursor

" always show signcolumns
set signcolumn=yes

" #########################
" mappings
" #########################

    map <leader>re :execute "edit " . $MYVIMRC<CR>
    map <leader>rs :execute "source " . $MYVIMRC<CR>

    nmap <Esc> <Esc>:nohlsearch<CR>

" secuencia de escape de la terminal de vim
    tnoremap <Esc> <C-\><C-n>
" para mover desde la terminal
	tnoremap <C-h> <C-\><C-n><C-w>h
	tnoremap <C-j> <C-\><C-n><C-w>j
	tnoremap <C-k> <C-\><C-n><C-w>k
	tnoremap <C-l> <C-\><C-n><C-w>l

" verificacion de escritura
	map <leader>oe :setlocal spell! spelllang=es<CR>
	map <leader>oi :setlocal spell! spelllang=en_us<CR>
	map <leader>ot :setlocal spell! spelllang=es,en_us<CR>

" correr la macro en q
    nnoremap <Leader><Space> @q

" continuar desde el ultimo lugar trabajado
	" execute 'nmap ñ a'.comentario.'<+Continuar+> <esc>'

" saltar entre palabras clave <+palabra+>
	" nnoremap <Leader>l /<+.\{-1,}+><cr>c/+>/e<cr>
	" inoremap <Leader>l <ESC>/<+.\{-1,}+><cr>c/+>/e<cr>

" mostrar las marcas
    nnoremap '? :marks <cr>

    " para solo mostrar las marcas dentro del archivo
	nnoremap <Leader>' :marks abcdefghijklmnopqrstuvwxyz<cr>:'

    " estoy usando floatterm en vez
    noremap <Leader>. <esc> :vsp <cr> :term <cr>

    " para esto estoy usando Clap
    noremap <Leader>ñ :FZF <cr>

" porque quiero, puedo y no tengo miedo
	nnoremap <Leader>c :call Compilar() <cr>

" para termdebug
    " da el valor de la variable
    nnoremap <RightMouse> :Evaluate<CR>
    " pone un break
	nnoremap <RightMouse> :Break<CR>

" compilar con make y mostrar salida
    " nnoremap <Leader>m :make <cr>
    " nnoremap <Leader>m :Dispatch <cr>
    nnoremap <Leader><C-m> :copen <cr>
    " nnoremap <Leader>m :lopen 5 <cr>
    nnoremap <Leader>m :botright lwindow 5<cr>

"mover entre buffers
    noremap <Leader>j <esc>:bp<cr>
    noremap <Leader>k <esc>:bn<cr>
    noremap <Leader>l :ls<CR>:b<space>

" Close buffer (without closing window)
    nnoremap <expr><leader>w len(getbufinfo("")[0].windows) > 1 ?
        \ ":close<CR>" :
        \ (bufnr("") == getbufinfo({"buflisted": 1})[-1].bufnr ? ":bp" : ":bn")."<bar>bd #<CR>"

" hacerle fold a todo lo que este entre {}
    noremap <Leader>b <esc>va}zf

" cortes
    noremap <Leader>wv <esc>:vsp<cr>
    noremap <Leader>ws <esc>:sp<cr>
    noremap <Leader>wt <esc>:tabnew %<cr>

" cerrar sesion
    noremap <Leader>q <esc> :SClose<cr>

" final funciones con <Leader> -----------------------------------

    nnoremap gb gT
	" quitar modo Ex - que ademas ni idea para que sirve :v
	nnoremap Q <nop>

	inoremap <C-a> <esc>
" funciones generales de otros editores
" guardar
	 noremap <C-s> :w<cr>
	inoremap <C-s> <esc><esc>:w<cr>
	vnoremap <C-s> <esc><esc>:w<cr>

" deshacer
	inoremap <C-z> <esc> ui
	 noremap <C-z> u
" salir
     noremap <C-q> <esc>:q<cr>
    inoremap <C-q> <esc><esc>:wq<cr>

	"  noremap <C-q> <esc>:call Cerrar()<cr>
	" inoremap <C-q> <esc><esc>:call Cerrar()<cr>

    "make < > shifts keep selection
    vnoremap <tab> >gv
    vnoremap <S-tab> <gv

    " nnoremap <tab> >>
    " nnoremap <S-tab> <<
    nnoremap <tab> <C-w>

" copiar y pegar
	vnoremap <C-c> "*y :let @+=@* <cr>
	nnoremap <C-c> "*yy:let @+=@*<cr>
	inoremap <C-c> <esc>"*yy:let @+=@*<cr>a
	nnoremap <C-p> "+P
" pegar en insert
	inoremap <C-p> <esc>"+pa
    inoremap <C-v> <esc>"+pa


" mover entre splits
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k
	noremap <C-l> <C-w>l

	noremap j gj
	noremap k gk
	noremap <DOWN> gj
	noremap <UP> gk

	map gf :edit <cfile><cr>

" #######################
" funciones
" #######################

" cargar templates previamente establecidos, en caso de no existir, no hace
" nada
function! LoadTemplate(extension)
	silent! execute '0r ~/.config/nvim/templates/templates/T*-'.a:extension.'-*.tpl'
	silent! execute 'source ~/.config/nvim/templates/patterns/P*-'.a:extension.'-*.tpl'
endfunction

" esta de mas, pero asi logre que funcionara...
" busca '!cursor!' y va a esa ubicacion -- funciona en conjunto a las
" abreviaciones
function! IrACursor()
	:call search('!cursor!','b')
endfunction

function! DebugA()
	let nom = expand('%:p')
	let comp = expand('%:p:r')
	let ext = expand('%:e')

    call Compilar()

	if ( ext == "c" || ext == "cxx" || ext =="cpp" )
	    let termdebugger = "gdb"
		execute ':Termdebug '.comp
	elseif ( ext == "py" )
	    let termdebugger = "pytohn -m pdb"
		execute ':Termdebug '.nom
	elseif ( ext == "rs" )
        echo "io no c sto como funciona :v"
		" execute ':! rustc '.nom
		" execute ':! cargo run '
	else
		echom 'lenguaje no integrado'
	endif

endfunction

function Compilar()
	let nom = expand('%:p')
	let comp = expand('%:p:r')
	let ext = expand('%:e')

    " para guardar el archivo antes de compilarlo, ya que usualmente me olvido :v
    execute ':w'

    let runc = ""
	if ( ext == "c" )
		let runc = 'gcc '.nom.' -o '.comp
	elseif ( ext == "cxx" || ext =="cpp" )
		let runc = 'g++ '.nom.' -ggdb -o '.comp
	elseif ( ext == "py" )
		let runc = 'python '.nom
	elseif ( ext == "md" )
        let runc = 'pandoc -s -o '.comp.'.pdf '.nom.' ; xdg-open '.comp.'.pdf'
	elseif ( ext == "rs" )
		" run = ':! rustc '.nom
		let runc = 'cargo run '
	else
		echom 'lenguaje no integrado'
	endif

    if ( runc != "" )
        " echo runc
        execute ':! '.runc
        " execute ':silent ! ( '.runc.' )&> /dev/null & '
        " echo 'compilado'
    endif

endfunction

" esto esta en desarrollo
function! Cerrar()
    execute ':w'
    let size = buffer_number()
    if size > 1
        let buffclose = bufname()
        " echon buffclose
        execute 'bNext'
        execute 'bd '.buffclose
    else
        " echon "saliendo"
        execute ':q'
    endif
endfunction

fun! <SID>StripTrailingWhitespaces()
	let ext = expand('%:e')

    if( ext != "md" && ext != "csv" ) " no limpiar lineas en markdown
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endif
endfun

