let mapleader = " "

" #########################
" mappings
" #########################

    map <leader>re :execute "edit " . $MYVIMRC<CR>
    map <leader>rs :execute "source " . $MYVIMRC<CR>

    nmap <Esc> <Esc>:nohlsearch<CR>

" secuencia de escape de la terminal de vim
    " tnoremap <Esc> <C-\><C-n>
    " if has("nvim")
    "   au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
    "   au FileType fzf tunmap <buffer> <Esc>
    " endif
    " cambiar el comportamiento de esc para fzf, para cerrarlo
    tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
" para mover desde la terminal
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    " dejemos esto por el momento como prueba
    " inoremap <Leader><Leader> <esc>

" verificacion de escritura
    map <leader>oe :setlocal spell! spelllang=es<CR>
    map <leader>oi :setlocal spell! spelllang=en_us<CR>
    map <leader>ot :setlocal spell! spelllang=es,en_us<CR>

" correr la macro en q, que aveces sin querer la sobreescribo
    nnoremap <Leader><Space> @q

" mostrar las marcas
    nnoremap '? :marks <cr>

" para solo mostrar las marcas dentro del archivo
    nnoremap <Leader>' :marks abcdefghijklmnopqrstuvwxyz<cr>:'

" abrir terminal
    noremap <Leader>. <esc> :vsp <cr> :term <cr>
    " noremap <Leader>. :call TermToggle(25) <cr>

    " ver arbol de archivos
    noremap <Leader>t :Lexplore <cr>

" porque quiero, puedo y no tengo miedo
    nnoremap <Leader>c :call Compilar() <cr>

" para termdebug
    " da el valor de la variable
    nnoremap <RightMouse> :Evaluate<CR>
    " pone un break
    nnoremap <RightMouse> :Break<CR>

" compilar con make y mostrar salida
    nnoremap <Leader><C-m> :copen <cr>
    " nnoremap <Leader>m :lopen 5 <cr>

" muestra errores
    nnoremap <Leader>m :botright lwindow 5<cr>

"mover entre buffers
    noremap <Leader>j <esc>:bp<cr>
    noremap <Leader>k <esc>:bn<cr>
    " jetpack
    " noremap <Leader>l :ls<CR>:b<space>
    noremap <Leader>l :FZFBuffer <cr>

    " para no tenerlo que estar cambiando al cambiar
    " de computadores

    nnoremap <Leader>s :FZFLines <cr>

    " let tipo = call Keyboard_type() =~"us"
    if Keyboard_type("us")
        noremap <Leader>; :FZF <cr>
" el mejor fuzzy finder que he encontrado en nativo
        " noremap <Leader>ñ :e **/*
    else
        noremap <Leader>ñ :FZF <cr>
    endif

" Close buffer (without closing window)
    " nnoremap <expr><leader>w len(getbufinfo("")[0].windows) > 1 ?
    "     \ ":close<CR>" :
    "     \ (bufnr("") == getbufinfo({"buflisted": 1})[-1].bufnr ? ":bp" : ":bn")."<bar>bd #<CR>"

" hacerle fold a todo lo que este entre {}
    noremap <Leader>b <esc>va}zf

" cortes
    " <tab>t oficialmente sirve para ir a la ventana superior izquierda, pero no se si lo use mucho
    " me gusta mas la funcion que yo le tengo :D
    noremap <tab>t <esc>:tabnew %<cr>
    nnoremap <tab> <C-w>
    " noremap <Leader>wv <esc>:vsp<cr> " esto se puede con tab tab
    " noremap <Leader>ws <esc>:sp<cr> " esto se puede con tab v
    " noremap <Leader>wt <esc>:tabnew %<cr>

" final funciones con <Leader> -----------------------------------

    nnoremap gb gT
" quitar modo Ex - que ademas ni idea para que sirve :v
    nnoremap Q <nop>

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
    " inoremap <C-q> <esc><esc>:wq<cr>

    vnoremap <tab> >gv
    vnoremap <S-tab> <gv

    " nnoremap <tab> >>
    " nnoremap <S-tab> <<

" copiar y pegar
    vnoremap <C-c> "*y :let @+=@* <cr>
    nnoremap <C-c> "*yy:let @+=@*<cr>
    inoremap <C-c> <esc>"*yy:let @+=@*<cr>a
    "nnoremap <C-p> "+P
" pegar en insert
    inoremap <C-p> <esc>"+pa
    inoremap <C-v> <esc>"+pa

" copiar hasta el final de linea
    nnoremap Y y$


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
