
let g:currentmode={
    \'n' : 'Normal ',
    \'no' : 'N·Operator Pending ',
    \'v' : 'Visual ',
    \'V' : 'V·Line ',
    \'^V' : 'V·Block ',
    \'s' : 'Select ',
    \'S': 'S·Line ',
    \'^S' : 'S·Block ',
    \'i' : 'Insert ',
    \'R' : 'Replace ',
    \'Rv' : 'V·Replace ',
    \'c' : 'Command ',
    \'cv' : 'Vim Ex ',
    \'ce' : 'Ex ',
    \'r' : 'Prompt ',
    \'rm' : 'More ',
    \'r?' : 'Confirm ',
    \'!' : 'Shell ',
    \'t' : 'Terminal '
    \}

highlight InactiveColor guibg=#3e4249 guifg=#b7bec9
highlight GitColor guibg=#3e4249
" Get current mode
function! ModeCurrent() abort
    let l:modecurrent = mode()

    if l:modecurrent == 'n'                 " normal
        hi Mode guibg=#a1bf78 guifg=#3e4249
    elseif l:modecurrent == 'i'             " insert
        hi Mode guibg=#73b3e7 guifg=#3e4249
    elseif l:modecurrent == 'r'             " replace
        hi Mode guibg=#d390e7 guifg=#3e4249
    elseif l:modecurrent == "\<C-V>"        " esto es V-BLOCK
        hi Mode guibg=#e77171 guifg=#3e4249
    elseif l:modecurrent == 'v'             " visual
        hi Mode guibg=#e77171 guifg=#3e4249
    elseif l:modecurrent == 't'             " terminal
        hi Mode guibg=#73b3e7 guifg=#3e4249
    elseif l:modecurrent == 'c'             " command
        hi Mode guibg=#e77171 guifg=#3e4249
    elseif l:modecurrent == 's'             " select
        hi Mode guibg=#d390e7 guifg=#3e4249
    else
        hi Mode ctermbg=5 ctermfg=232
    endif

    return toupper(get(g:currentmode, l:modecurrent, 'V·Block '))
endfunction


function! ActiveStatus()
    let statusline  = ""
    let statusline .= "%#Mode# %{'\     \ '.ModeCurrent().'\' }"
    let statusline .= "%#GitColor#%(\     %{GitBranch()}\ %)"
    let statusline .= "%1*"
    let statusline .= " %{Filename()}"
    let statusline .= " %m"
    let statusline .= "%="
    let statusline .= "%#InactiveColor#"
    let statusline .= " %Y"
    let statusline .= " |"
    let statusline .= " LN: %L"
    return statusline
endfunction

function! InactiveStatus()
    let statusline  =""
    let statusline .="%#InactiveColor#"
    " let statusline.=" %F"
    let statusline .= " %{Filename()}"
    let statusline .=" %m"
    let statusline .="%="
    let statusline .=" %Y"
    return statusline
endfunction

augroup status
    autocmd!
    autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveStatus()
    autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveStatus()
augroup END

function! GitBranch()
    let br = fugitive#head()
    if br != ""
        return br." "
    endif
    return ""
endfunction

" Show path of filename
function! Filename()
    return expand('%')
endfunction
" function! Gitbranch()
"     return substitute( system('git rev-parse --abbrev-ref HEAD 2> /dev/null'), '\n', '','g')
" endfunction

set statusline=%!ActiveStatus()
