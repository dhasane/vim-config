

" ######################
" pluggins
" ######################

call plug#begin('~/.vim/plugged')

 " utilidades
 Plug 'lifepillar/vim-gruvbox8'

 Plug 'christoomey/vim-tmux-navigator'  			" simplificar movimiento entre vim y tmux

call plug#end()


    " if hidden is not set, TextEdit might fail.

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-tab> to trigger completion.
    inoremap <silent><expr> <c-tab> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction


" para unir esto a tmux
" let g:tmux_navigator_no_mappings = 1

    noremap <c-h> <esc>
    noremap <c-j> <esc>
    noremap <c-k> <esc>
    noremap <c-l> <esc>

    noremap <silent> <c-h> <esc>:TmuxNavigateLeft<cr>
    noremap <silent> <c-j> <esc>:TmuxNavigateDown<cr>
    noremap <silent> <c-k> <esc>:TmuxNavigateUp<cr>
    noremap <silent> <c-l> <esc>:TmuxNavigateRight<cr>
    noremap <silent> <c-/> <esc>:TmuxNavigatePrevious<cr>

" Write all buffers before navigating from Vim to tmux pane
    let g:tmux_navigator_save_on_switch = 2

" Clap

	noremap <Leader>ñ :Clap files <cr>
	noremap <Leader>s :Clap blines <cr>
	noremap <Leader>p :Clap <cr>


        " Show path of filename
        function! FilenameForLightline()
            return expand('%')
        endfunction

