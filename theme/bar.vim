
" originalmente de :
" https://cryptpad.fr/code/#/2/code/view/n4isJrnG0tnGnXXbXORGxs9wrGLI4q4I8I7xnozm-Xw/

 highlight InactiveColor guibg=#3e4249 guifg=#b7bec9
 highlight NormalColor guibg=#a1bf78 guifg=#3e4249
 highlight InsertColor guibg=#73b3e7 guifg=#3e4249
 highlight ReplaceColor guibg=#d390e7 guifg=#3e4249
 highlight VisualColor guibg=#e77171 guifg=#3e4249
 highlight TerminalColor guibg=#73b3e7 guifg=#3e4249
 highlight SelectColor guibg=#d390e7 guifg=#3e4249
 highlight CommandColor guibg=#e77171 guifg=#3e4249
 highlight GitColor guibg=#3e4249

 function! ActiveStatus()
    let statusline=""
    let statusline.="%#NormalColor#%{(mode()=='n')?'\     \ NORMAL\ ':''}"
    let statusline.="%#InsertColor#%{(mode()=='i')?'\     \ INSERT\ ':''}"
    let statusline.="%#ReplaceColor#%{(mode()=='R')?      '\ \ REPLACE\ ':''}"
    let statusline.="%#VisualColor#%{(mode()=='v')?'\     \ VISUAL\ ':''}"
    let statusline.="%#VisualColor#%{(mode()=='V')?'\     \ VISUAL\ ':''}"
    let statusline.="%#VisualColor#%{(mode()=='^V')?      '\ \ VISUAL\ ':''}"
    let statusline.="%#TerminalColor#%{(mode()=='t')?     '\ \ TERMINAL\ ':''}"
    let statusline.="%#CommandColor#%{(mode()=='c')?      '\ \ COMMAND\ ':''}"
    let statusline.="%#SelectColor#%{(mode()=='s')?'\     \ SELECT\ ':''}"
    let statusline.="%#GitColor#%(\     %{Gitbranch()}\ %)"
    let statusline.="%1*"
    let statusline.=" %F"
    let statusline.=" %m"
    let statusline.="%="
     let statusline.="%#InactiveColor#"
    "let statusline.=" WD: %{wordcount().words}"
    "let statusline.=" |"
    let statusline.=" LN: %L"
    let statusline.=" |"
    "    let statusline.="%(\ %Y%)"
    let statusline.=" [%n] "
    return statusline
 endfunction

 function! InactiveStatus()
     let statusline=""
     let statusline.="%#InactiveColor#"
     let statusline.=" %F"
     let statusline.=" %m"
     let statusline.="%="
     let statusline.=" %Y"
     let statusline.=" [%n] "
     return statusline
 endfunction

 augroup status
     autocmd!
     autocmd WinEnter,BufEnter * setlocal statusline=%!ActiveStatus()
     autocmd WinLeave,BufLeave * setlocal statusline=%!InactiveStatus()
 augroup END

function! Gitbranch()
    return substitute( system('git rev-parse --abbrev-ref HEAD 2> /dev/null'), '\n', '','g')
endfunction
set statusline=%!ActiveStatus()
