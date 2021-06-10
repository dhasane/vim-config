
vim.g.mapleader = ' '

-- e :Telescope find_file
-- E :Telescope file_browser

vim.api.nvim_set_keymap('n', '<F3>', ':set number! relativenumber!<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<F4>', ':set list! list?<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<F7>', ':NvimTreeToggle<CR>', {noremap = false, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nm', ':Dispatch npm start<CR>', {noremap = false, silent = false})
-- Buffers
vim.api.nvim_set_keymap('n', '<leader>bda', ':BufferCloseAllButCurrent<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', {noremap = false, silent = false})
-- Git
vim.api.nvim_set_keymap('n', '<leader>gf', ':20G<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gg', ':LazyGit<CR>', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gd', ':DiffviewOpen<CR>', {noremap = false, silent = false})
-- Ctrlsf
vim.api.nvim_set_keymap('n', '<C-F>f', '<Plug>CtrlSFPrompt', {noremap = false, silent = false})
vim.api.nvim_set_keymap('v', '<C-F>f', '<Plug>CtrlSFVwordExec', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>n', '<Plug>CtrlSFCwordExec', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', '<C-F>t', ':CtrlSFToggle<CR>', {noremap = true, silent = false})
-- Easy-align
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {noremap = false, silent = false})
-- Vim-sneak
vim.api.nvim_set_keymap('n', 'f', '<Plug>Sneak_f', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'F', '<Plug>Sneak_F', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 't', '<Plug>Sneak_t', {noremap = false, silent = false})
vim.api.nvim_set_keymap('n', 'T', '<Plug>Sneak_T', {noremap = false, silent = false})
-- LSP
vim.api.nvim_set_keymap('n', '<space>,', ':lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>;', ':lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>a', ':lua vim.lsp.diagnostic.code_action()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>d', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>f', ':lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>h', ':lua vim.lsp.buf.hover()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>m', ':lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>r', ':lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<space>s', ':lua vim.lsp.buf.document_symbol()<CR>', {noremap = true, silent = true})
-- Spectre
vim.api.nvim_set_keymap('n', '<leader>S', ":lua require('spectre').open()<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap('v', '<leader>S', ":lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>Sw', "viw:lua require('spectre').open_visual()<CR>", {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>sp', "viw:lua require('spectre').open_file_search()<CR>", {noremap = true, silent = false})
-- Telescope
vim.api.nvim_set_keymap('n', '<leader>r', ":lua require('telescope.builtin').live_grep()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bb', ":lua require('telescope.builtin').buffers()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>m', ":lua require('telescope.builtin').marks()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>t', ":lua require('telescope.builtin').treesitter()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', ":lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', ":lua require('plugins.telescope').project_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>p', ":lua require('telescope').extensions.project.project{}<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>c', ":lua require('plugins.telescope').my_git_commits()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>g', ":lua require('plugins.telescope').my_git_status()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', ":lua require('plugins.telescope').my_git_bcommits()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n', ":lua require('plugins.telescope').my_note()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>nn', ":e ~/Note/", {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>gc', ':Octo issue create<CR>', {noremap = true, silent = false})
vim.api.nvim_set_keymap('n', '<leader>i', ':Octo issue list<CR>', {noremap = true, silent = false})
-- HlsLens
vim.api.nvim_set_keymap('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '*', "*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', '#', "#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
vim.api.nvim_set_keymap('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>", { noremap = true })
-- Todo-comments
vim.api.nvim_set_keymap('n', '<leader>to', ':TodoTelescope<CR>', {noremap = true, silent = false})
-- Fterm
vim.api.nvim_set_keymap('n', '<F5>', '<CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<F5>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })


local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- " #########################
-- " mappings
-- " #########################

map('', '<leader>re', ':execute "edit " . $MYVIMRC<CR>')
map('', '<leader>rs', ':execute "source " . $MYVIMRC<CR>')

map('n', '<Esc>', '<Esc>:nohlsearch<CR>')

-- verificacion de escritura
--    map <leader>oe :setlocal spell! spelllang=es<CR>
--    map <leader>oi :setlocal spell! spelllang=en_us<CR>
--    map <leader>ot :setlocal spell! spelllang=es,en_us<CR>

-- correr la macro en q, que aveces sin querer la sobreescribo
--    nnoremap <Leader><Space> @q

-- " mostrar las marcas
--     nnoremap '? :marks <cr>
--
-- " para solo mostrar las marcas dentro del archivo
--     nnoremap <Leader>' :marks abcdefghijklmnopqrstuvwxyz<cr>:'

-- " abrir terminal
--     noremap <Leader>. <esc> :vsp <cr> :term <cr>
--     " noremap <Leader>. :call TermToggle(25) <cr>
--
--     " ver arbol de archivos
--     noremap <Leader>t :Lexplore <cr>
--
--     nnoremap <Leader>w <C-w>
--
-- " porque quiero, puedo y no tengo miedo
--     nnoremap <Leader>c :call Compilar() <cr>
--
-- " para termdebug
--     " da el valor de la variable
--     nnoremap <RightMouse> :Evaluate<CR>
--     " pone un break
--     nnoremap <RightMouse> :Break<CR>
--
-- " compilar con make y mostrar salida
--     nnoremap <Leader><C-m> :copen <cr>
--     " nnoremap <Leader>m :lopen 5 <cr>
--
-- " muestra errores
--     nnoremap <Leader>m :botright lwindow 5<cr>
--
-- "mover entre buffers
--     noremap <Leader>j <esc>:bp<cr>
--     noremap <Leader>k <esc>:bn<cr>
--     " jetpack
--     " noremap <Leader>l :ls<CR>:b<space>
--     noremap <Leader>l :FZFBuffer <cr>
--
--     " para no tenerlo que estar cambiando al cambiar
--     " de computadores
--
--     nnoremap <Leader>s :FZFLines <cr>
--
--     " let tipo = call Keyboard_type() =~"us"
--     if Keyboard_type("us")
--         noremap <Leader>; :FZF <cr>
-- " el mejor fuzzy finder que he encontrado en nativo
--         " noremap <Leader>ñ :e **/*
--     else
--         noremap <Leader>ñ :FZF <cr>
--     endif
--
-- " Close buffer (without closing window)
--     " nnoremap <expr><leader>w len(getbufinfo("")[0].windows) > 1 ?
--     "     \ ":close<CR>" :
--     "     \ (bufnr("") == getbufinfo({"buflisted": 1})[-1].bufnr ? ":bp" : ":bn")."<bar>bd #<CR>"
--
-- " hacerle fold a todo lo que este entre {}
--     noremap <Leader>b <esc>va}zf
--
-- " cortes
--     " <tab>t oficialmente sirve para ir a la ventana superior izquierda, pero no se si lo use mucho
--     " me gusta mas la funcion que yo le tengo :D
--     noremap <tab>t <esc>:tabnew %<cr>
--     nnoremap <tab> <C-w>
--     " noremap <Leader>wv <esc>:vsp<cr> " esto se puede con tab tab
--     " noremap <Leader>ws <esc>:sp<cr> " esto se puede con tab v
--     " noremap <Leader>wt <esc>:tabnew %<cr>
--
-- " final funciones con <Leader> -----------------------------------
--
--     nnoremap gb gT
-- " quitar modo Ex - que ademas ni idea para que sirve :v
--     nnoremap Q <nop>
--
-- " funciones generales de otros editores
-- " guardar
--      noremap <C-s> :w<cr>
--     inoremap <C-s> <esc><esc>:w<cr>
--     vnoremap <C-s> <esc><esc>:w<cr>
-- " deshacer
--     inoremap <C-z> <esc> ui
--      noremap <C-z> u
-- " salir
--      noremap <C-q> <esc>:q<cr>
--     " inoremap <C-q> <esc><esc>:wq<cr>
--
--     vnoremap <tab> >gv
--     vnoremap <S-tab> <gv
--
--     " nnoremap <tab> >>
--     " nnoremap <S-tab> <<
--
-- " copiar y pegar
--     " vnoremap <C-c> "*y :let @+=@* <cr>
--     " nnoremap <C-c> "*yy:let @+=@*<cr>
--     " inoremap <C-c> <esc>"*yy:let @+=@*<cr>a
--     "nnoremap <C-p> "+P
-- " pegar en insert
--     inoremap <C-p> <esc>"+pa
--     inoremap <C-v> <esc>"+pa
--
-- " copiar hasta el final de linea
--     nnoremap Y y$


-- " mover entre splits
--     noremap <C-h> <C-w>h
--     noremap <C-j> <C-w>j
--     noremap <C-k> <C-w>k
--     noremap <C-l> <C-w>l
--
--     noremap j gj
--     noremap k gk
--     noremap <DOWN> gj
--     noremap <UP> gk
--
--     map gf :edit <cfile><cr>
