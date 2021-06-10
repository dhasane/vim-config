
local opt = vim.opt

-- Global
opt.fillchars = { vert = ' ' }
opt.showtabline = 2
opt.scrolloff = 5
opt.mouse = 'a'
opt.backupcopy = 'yes'
opt.undolevels = 1000
opt.shortmess:append { c = true, S = true }
opt.showmode = false
opt.hidden = true
opt.splitright = true
opt.splitbelow = true
opt.wrapscan = true
opt.backup = false
opt.writebackup = false
opt.showcmd = true
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.smartcase = true
opt.errorbells = false
opt.joinspaces = false
opt.title = true
opt.lazyredraw = true
opt.encoding = 'UTF-8'
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.listchars = { tab = ">>>", trail = "·", precedes = "←", extends = "→",eol = "↲", nbsp = "␣" }
opt.showbreak = '\\'

opt.ignorecase = true
-- Buffer
opt.fileformat = 'unix'
opt.tabstop = 2
opt.spelllang = 'it'
opt.softtabstop = 4
opt.swapfile = false
opt.undofile = false
opt.expandtab = true
opt.shiftwidth = 2
-- Window
opt.number = true
opt.colorcolumn = "+1"
opt.foldmethod = 'indent'
opt.foldlevel = 1
opt.list = false
opt.foldnestmax = 10
opt.signcolumn = 'yes'
opt.relativenumber = true
opt.foldenable = false
opt.cursorline = true

vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
