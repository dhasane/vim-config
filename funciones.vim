
" #######################
" funciones
" #######################

" cargar templates previamente establecidos, en caso de no existir, no hace
" nada
" idea interesante, pero casi no la use
" function! LoadTemplate(extension)
"     silent! execute '0r ~/.config/nvim/templates/templates/T*-'.a:extension.'-*.tpl'
"     silent! execute 'source ~/.config/nvim/templates/patterns/P*-'.a:extension.'-*.tpl'
" endfunction

" esta de mas, pero asi logre que funcionara...
" busca '!cursor!' y va a esa ubicacion -- funciona en conjunto a las
" abreviaciones
function! IrACursor()
    :call search('!cursor!','b')
endfunction

fun! StripTrailingWhitespaces()
    let ext = expand('%:e')

    if( ext != "md" && ext != "csv" ) " no limpiar lineas en markdown
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endif
endfun

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

fun Run()
    let nom = expand('%:p')
    let comp = expand('%:p:r')
    let ext = expand('%:e')

    " para guardar el archivo antes de compilarlo, ya que usualmente me olvido :v
    execute ':w'

    let l:runc = ""
    if ( ext == "c" )
        let l:runc = './'.comp
    elseif ( ext == "cxx" || ext =="cpp" )
        let l:runc = './'.comp
    elseif ( ext == "py" )
        let l:runc = 'python '.nom
    elseif ( ext == "md" )
        let l:runc = 'xdg-open '.comp.'.pdf'
    elseif ( ext == "rs" )
        let l:runc = 'cargo run '
    elseif ( ext == "rb" )
        let l:runc = 'ruby '.nom
    else
        echom 'lenguaje no integrado'
    endif

    if ( l:runc != "" )
        execute ':! '.l:runc
    endif

endfun

function Compilar()
    let nom = expand('%:p')
    let comp = expand('%:p:r')
    let ext = expand('%:e')

    let l:runc = ""
    if ( ext == "c" )
        let l:runc = 'gcc '.nom.' -o '.comp
    elseif ( ext == "cxx" || ext =="cpp" )
        let l:runc = 'g++ '.nom.' -ggdb -o '.comp
    elseif ( ext == "md" )
        let l:runc = 'pandoc -s -o '.comp.'.pdf '.nom
    elseif ( ext == "rs" )
        " run = ':! rustc '.nom
        let l:runc = 'cargo run '
    else
        echom 'lenguaje no integrado'
    endif

    if ( l:runc != "" )
        execute ':silent ! ( '.l:runc.' )&> /dev/null & '
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


" retorna si el tipo de teclado contiene type
fun Keyboard_type(type)
    return substitute(system("setxkbmap -query | grep layout | awk '{print $2}'"), '\n', '', 'g') =~ a:type
endfun

" esto se siente como un machetaso, pero mas o menos funciona
" sirve para volver transparente una ventana especifica
fun! Fondo(tr)

    hi transparent guifg=#ebdbb2 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi opaque guifg=#ebdbb2 guibg=#32302f guisp=NONE gui=NONE cterm=NONE

    if has('nvim')
        if a:tr == 1
            setlocal winhighlight=Normal:transparent,NormalNC:opaque
            hi Normal guibg=none
        else
            setlocal winhighlight=Normal:opaque,NormalNC:opaque
            hi Normal guifg=#ebdbb2 guibg=#32302f guisp=NONE gui=NONE cterm=NONE
        endif

        " experimentos
        " hi Normal guibg=none ctermbg=none
        " hi InactiveWindow guifg=#ebdbb2 guibg=#32302f guisp=NONE gui=NONE cterm=NONE
        " hi BlackBg guibg=#000080 ctermbg=none
        " au TermOpen * :set winhighlight=Normal:BlackBg, NormalNC:InactiveWindow
    endif
endfun

let s:term_buf = 0
let s:term_win = 0

function! TermToggle(height)
    if win_gotoid(s:term_win)
        hide
    else
        new terminal
        exec "resize " . a:height
        try
            exec "buffer " . s:term_buf
            exec "bd terminal"
        catch
            call termopen($SHELL, {"detach": 0})
            let s:term_buf = bufnr("")
        endtry
        let s:term_win = win_getid()
    endif
endfunction

function! FloatTermToggle()
    if win_gotoid(s:term_win)
        hide
        bwipeout!
    else
        call CreateCenteredFloatingWindow()
        try
            exec "buffer " . s:term_buf
            exec "bd terminal"
        catch
            call termopen($SHELL, {"detach": 0, 'on_exit': function('OnTermExit') })
            let s:term_buf = bufnr("")
        endtry
        let s:term_win = win_getid()
    endif
endfunction

function! ToggleTerm(cmd)
    if empty(bufname(a:cmd))
        call CreateCenteredFloatingWindow()
        call termopen(a:cmd, { 'on_exit': function('OnTermExit') })
    else
        bwipeout!
    endif
endfunction

function! CreateCenteredFloatingWindow()
    let width  = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let top    = ((&lines - height) / 2) - 1
    let left   = (&columns - width) / 2
    let opts   = { 'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal' }
    let top    = "╭" . repeat("─", width - 2) . "╮"
    let mid    = "│" . repeat(" ", width - 2) . "│"
    let bot    = "╰" . repeat("─", width - 2) . "╯"
    let lines  = [top] + repeat([mid], height - 2) + [bot]
    let s:buf  = nvim_create_buf(v:false, v:true)

    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)

    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, CreatePadding(opts))

    " cerrar el buffer al cerrar lo que se este haciendo dentro de este
    autocmd BufWipeout <buffer> exe 'bwipeout '.s:buf

endfunction

function! OnTermExit(job_id, code, event) dict
    if a:code == 0
        bwipeout!
    endif
endfunction

function! CreatePadding(opts)
    let a:opts.row    += 1
    let a:opts.height -= 2
    let a:opts.col    += 2
    let a:opts.width  -= 4
    return a:opts
endfunction

" funcionalidades de busqueda con FZF

function! s:line_handler(l)
  let keys = split(a:l, ':\t')
  exec 'buf' keys[0]
  exec keys[1]
  normal! ^zz
endfunction

function! s:buffer_lines()
  let res = []
  for b in filter(range(1, bufnr('$')), 'buflisted(v:val)')
    call extend(res, map(getbufline(b,0,"$"), 'b . ":\t" . (v:key + 1) . ":\t" . v:val '))
  endfor
  return res
endfunction

command! FZFLines call fzf#run
            \({
            \   'source':  <sid>buffer_lines(),
            \   'sink':    function('<sid>line_handler'),
            \   'options': '--extended --nth=3..',
            \   'down':    '25%'
            \})

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

command! FZFBuffer call fzf#run
            \({
            \   'source':  reverse(<sid>buflist()),
            \   'sink':    function('<sid>bufopen'),
            \   'options': '+m',
            \   'down':    len(<sid>buflist()) + 2
            \})



