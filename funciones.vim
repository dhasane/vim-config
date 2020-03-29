
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
    let l:runnable = 0

    let l:runc = ""
	if ( ext == "c" )
		let l:runc = 'gcc '.nom.' -o '.comp
	elseif ( ext == "cxx" || ext =="cpp" )
		let l:runc = 'g++ '.nom.' -ggdb -o '.comp
	elseif ( ext == "py" )
		let l:runc = 'python '.nom
        let l:runnable = 1
	elseif ( ext == "md" )
        let l:runc = 'pandoc -s -o '.comp.'.pdf '.nom.' ; xdg-open '.comp.'.pdf'
	elseif ( ext == "rs" )
		" run = ':! rustc '.nom
		let l:runc = 'cargo run '
        let l:runnable = 1
	else
		echom 'lenguaje no integrado'
	endif

    if ( l:runc != "" )
        " echo l:runc
        if l:runnable
            " si puede correr de una, quiero ver el resultado
            execute ':! '.l:runc
        else
            execute ':silent ! ( '.l:runc.' )&> /dev/null & '
        endif
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

