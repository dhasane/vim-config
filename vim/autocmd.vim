" #######################
" autocmd
" ######################

augroup Open
    au!
    " jump to the last position when reopening a file
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    "quitar continuacion de comentarios al pasar a la siguiente linea
    au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " au BufReadPre * setlocal foldmethod=indent
    " au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

augroup Save
    au!
    " quitar espacios al final de lineas
    " au BufWritePre * silent! call StripTrailingWhitespaces()
    " compila los archivos que se puedan compilar al guardar
    " au BufWrite * call Compilar()
augroup END

" au ColorScheme * hi Normal ctermbg=none guibg=none
" hi ActiveWindow   guibg=#2c323c

augroup TerminalBehavior
    autocmd!
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nowrap winfixwidth signcolumn=no noshowmode nocursorline
    autocmd TermOpen * startinsert
    autocmd TermClose * set laststatus=2 "ruler

    autocmd BufEnter term://* startinsert! " que entre directamente a la terminal
    " esto se siente macheteado, pero esta sirviendo
    autocmd BufEnter * setlocal winhighlight=Normal:opaque,NormalNC:opaque
    " autocmd TermEnter * silent! call Fondo(1)
    " autocmd TermLeave * silent! call Fondo(0)
    " au TermOpen * :set winhighlight=Normal:None
augroup END
