
" esto es lo del ejemplo
 function MyTabLine()
   let s = ''
   for i in range(tabpagenr('$'))
     " select the highlighting
     if i + 1 == tabpagenr()
       let s .= '%#TabLineSel#'
     else
       let s .= '%#TabLine#'
     endif

     " set the tab page number (for mouse clicks)
     let s .= '%' . (i + 1) . 'T'

     " the label is made by MyTabLabel()
     " let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
   endfor

   " after the last tab fill with TabLineFill and reset tab page nr
   let s .= '%#TabLineFill#%T'

   " right-align the label to close the current tab page
   if tabpagenr('$') > 1
     let s .= '%=%#TabLine#%999Xclose'
   endif

   return s
 endfunction
 function MyTabLabel(n)
   let buflist = tabpagebuflist(a:n)
   let winnr = tabpagewinnr(a:n)
   return bufname(buflist[winnr - 1])
 endfunction
 function! MyTabLine()
   let s = ''
   for i in range(tabpagenr('$'))
     let tabnr = i + 1 " range() starts at 0
     let winnr = tabpagewinnr(tabnr)
     let buflist = tabpagebuflist(tabnr)
     let bufnr = buflist[winnr - 1]
     let bufname = fnamemodify(bufname(bufnr), ':t')

     let s .= '%' . tabnr . 'T'
     let s .= (tabnr == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
     let s .= ' ' . tabnr

     let n = tabpagewinnr(tabnr,'$')
     if n > 1 | let s .= ':' . n | endif

     let s .= empty(bufname) ? ' [No Name] ' : ' ' . bufname . ' '

     let bufmodified = getbufvar(bufnr, "&mod")
     if bufmodified | let s .= '+ ' | endif
   endfor
   let s .= '%#TabLineFill#'
   return s
 endfunction
 set tabline=%!MyTabLine()
