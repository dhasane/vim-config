local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  --
  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.0', 
	  requires = { {'nvim-lua/plenary.nvim'} }
	  -- or                            , branch = '0.1.x',
  }

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- use 'sainnhe/gruvbox-material'
  use 'lifepillar/vim-gruvbox8'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
