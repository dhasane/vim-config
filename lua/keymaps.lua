local noremap = { noremap = true, silent = true }
local map = vim.keymap.set
local g = vim.g
local os = jit.os

g.mapleader = ' ' -- map leader to space

function ReloadConfig()
  -- for name,_ in pairs(package.loaded) do
  --   if name:match('^user') and not name:match('nvim-tree') then
  --     package.loaded[name] = nil
  --   end
  -- end

  dofile(vim.env.MYVIMRC)
  vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

function maps(base, mode, keymaps)
    local map = vim.keymap.set

    for i, keymap in ipairs(keymaps) do
        keybind = keymap[1]
        if type(keybind) == "table" then
            maps(base, mode, keymap)
        else
            command = keymap[2]
            opts = keymap[3]

            if keybind == nil then
                print("keybind is nil")
            elseif command == nil then
                print("command is nil")
            else
                map(mode, base .. keybind, command .. '<CR>', opts)
            end
        end
    end
end

function imaps(base, keymaps)
    keybinds = {}
    for i, keymap in ipairs(keymaps) do
        keybind = keymap[1]
        command = keymap[2]
        opts = keymap[3]
        table.insert( keybinds, { base .. keybind, command, opts } )
    end
    return keybinds
end

-- maps("<leader>t" , "n", {
--     {'p', ":tabnew"},
--     imaps("j", {
--         {"p", ":tabclose"}
--     })
-- })

maps("<leader><TAB>", 'n', {
    {'c', ':tabnew'},
    {'q', ':tabclose'},
})

maps('<leader>\'', 'n', {
    {'e', ':execute "edit " . $MYVIMRC'},
    -- {'s', ' :execute "source " . $MYVIMRC<CR>'},
    {'s', ':lua ReloadConfig'},
})

map("n", '<Esc>', '<Esc>:nohlsearch<CR>')

-- secuencia de escape de la terminal de vim
-- para mover desde la terminal
map("t", "<C-h>", "<C-\\><C-n><C-w>h", noremap) 
map("t", "<C-j>", "<C-\\><C-n><C-w>j", noremap) 
map("t", "<C-k>", "<C-\\><C-n><C-w>k", noremap) 
map("t", "<C-l>", "<C-\\><C-n><C-w>l", noremap) 

-- guardar y cerrar ventanas
map('n', '<C-s>', ':w<cr>', noremap)
map('i', '<C-s>', '<esc><esc>:w<cr>', noremap)
map('v', '<C-s>', '<esc><esc>:w<cr>', noremap)

map('n', '<C-q>', '<esc>:close<cr>', noremap)
map('i', '<C-q>', '<esc>:w<cr>:close<cr>', noremap)

-- mover entre splits
map('', '<C-h>', '<C-w>h', noremap)
map('', '<C-j>', '<C-w>j', noremap)
map('', '<C-k>', '<C-w>k', noremap)
map('', '<C-l>', '<C-w>l', noremap)

map('n', 'j', 'gj', noremap)
map('n', 'k', 'gk', noremap)
map('n', '<DOWN>', 'gj', noremap)
map('n', '<UP>', 'gk', noremap)

map('n', 'gf', ':edit <cfile><cr>')


--            -- verificacion de escritura
--            map <leader>oe :setlocal spell! spelllang=es<CR>
--            map <leader>oi :setlocal spell! spelllang=en_us<CR>
--            map <leader>ot :setlocal spell! spelllang=es,en_us<CR>
--            
--            -- correr la macro en q, que aveces sin querer la sobreescribo
--            -- nnoremap <Leader><Space> @q
--            
--            -- mostrar las marcas
--            --noremap '? :marks <cr>
--            
--            -- para solo mostrar las marcas dentro del archivo
--                --noremap <Leader>' :marks abcdefghijklmnopqrstuvwxyz<cr>:'
--            
--            -- abrir terminal
--                noremap <Leader>. <esc> :vsp <cr> :term <cr>
--                -- noremap <Leader>. :call TermToggle(25) <cr>
--            
--                -- ver arbol de archivos
--                noremap <Leader>t :Lexplore <cr>
--            
--            -- porque quiero, puedo y no tengo miedo
--                nnoremap <Leader>c :call Compilar() <cr>
--            
--            -- para termdebug
--                -- da el valor de la variable
--                nnoremap <RightMouse> :Evaluate<CR>
--                -- pone un break
--                nnoremap <RightMouse> :Break<CR>
--            
--            -- compilar con make y mostrar salida
--                nnoremap <Leader><C-m> :copen <cr>
--                -- nnoremap <Leader>m :lopen 5 <cr>
--            
--            -- muestra errores
--                nnoremap <Leader>m :botright lwindow 5<cr>
--            
--            --mover entre buffers
--                noremap <Leader>j <esc>:bp<cr>
--                noremap <Leader>k <esc>:bn<cr>
--                -- jetpack
--                -- noremap <Leader>l :ls<CR>:b<space>
--                noremap <Leader>l :FZFBuffer <cr>
--            
--                -- para no tenerlo que estar cambiando al cambiar
--                -- de computadores
--            
--                nnoremap <Leader>s :FZFLines <cr>
--            
--                -- let tipo = call Keyboard_type() =~"us"
--                if Keyboard_type("us")
--                    noremap <Leader>; :FZF <cr>
--            -- el mejor fuzzy finder que he encontrado en nativo
--                    " noremap <Leader>ñ :e **/*
--                else
--                    noremap <Leader>ñ :FZF <cr>
--                endif
--            
--            -- Close buffer (without closing window)
--                -- nnoremap <expr><leader>w len(getbufinfo("")[0].windows) > 1 ?
--                --     \ ":close<CR>" :
--                --     \ (bufnr("") == getbufinfo({"buflisted": 1})[-1].bufnr ? ":bp" : ":bn")."<bar>bd #<CR>"
--            
--            -- hacerle fold a todo lo que este entre {}
--                noremap <Leader>b <esc>va}zf
--            
--            -- cortes
--                -- <tab>t oficialmente sirve para ir a la ventana superior izquierda, pero no se si lo use mucho
--                -- me gusta mas la funcion que yo le tengo :D
--                noremap <tab>t <esc>:tabnew %<cr>
--                nnoremap <tab> <C-w>
--                -- noremap <Leader>wv <esc>:vsp<cr> " esto se puede con tab tab
--                -- noremap <Leader>ws <esc>:sp<cr> " esto se puede con tab v
--                -- noremap <Leader>wt <esc>:tabnew %<cr>
--            
--            -- final funciones con <Leader> -----------------------------------
--            
--                nnoremap gb gT
--            -- quitar modo Ex - que ademas ni idea para que sirve :v
--                nnoremap Q <nop>
--            
--            -- funciones generales de otros editores
--            -- salir
--                -- inoremap <C-q> <esc><esc>:wq<cr>
--            
--                vnoremap <tab> >gv
--                vnoremap <S-tab> <gv
--            
--                -- nnoremap <tab> >>
--                -- nnoremap <S-tab> <<
--            
--            -- copiar y pegar
--                -- vnoremap <C-c> "*y :let @+=@* <cr>
--                -- nnoremap <C-c> "*yy:let @+=@*<cr>
--                -- inoremap <C-c> <esc>"*yy:let @+=@*<cr>a
--                --nnoremap <C-p> "+P
--            -- pegar en insert
--                inoremap <C-p> <esc>"+pa
--                inoremap <C-v> <esc>"+pa
--            
--            -- copiar hasta el final de linea
--                nnoremap Y y$
