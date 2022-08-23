local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  use "kkharji/sqlite.lua"

    -- LSP
  use { 
      "neovim/nvim-lspconfig", 
      -- config = [[require('config.lsp')]], 
  }
  use 'onsails/lspkind-nvim'

  -- Autocomplete
  use 'hrsh7th/nvim-compe'
  -- use {
  --     "hrsh7th/nvim-cmp",
  --     config = [[require('config.cmp')]], -- may very based on config
  --     requires = {
  --         "hrsh7th/cmp-buffer",
  --         "hrsh7th/cmp-nvim-lsp",
  --         "hrsh7th/cmp-path",
  --         "hrsh7th/cmp-nvim-lua",
  --         "L3MON4D3/LuaSnip", -- may very based on config
  --         "onsails/lspkind-nvim",
  --     }
  -- }
  -- use 'SirVer/ultisnips'

    -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'p00f/nvim-ts-rainbow'
  -- use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua' }
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'romgrk/nvim-treesitter-context'

  use {
	  'nvim-telescope/telescope.nvim', 
	  tag = '0.1.0', 
	  requires = { {'nvim-lua/plenary.nvim'} },
	  -- config = [[require('telescope-conf.lua')]]
	  -- or                            , branch = '0.1.x',
  }
  use {
      "nvim-telescope/telescope-frecency.nvim",
      config = function()
          require"telescope".load_extension("frecency")
      end,
      requires = {"tami5/sqlite.lua"}
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-project.nvim" }

  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- use 'sainnhe/gruvbox-material'
  use 'lifepillar/vim-gruvbox8'

  -- org mode 
  use {'nvim-orgmode/orgmode', config = function()
      require('orgmode').setup{}
  end }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

