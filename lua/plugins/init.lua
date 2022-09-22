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
    use "neovim/nvim-lspconfig"
    use 'onsails/lspkind-nvim'

    -- Autocomplete
    use {
        "hrsh7th/nvim-cmp",
        -- config = [[require('config.cmp')]], -- may vary based on config
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip", -- may vary based on config
            "onsails/lspkind-nvim",
        }
    }
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
        config = function()
            require('plugins/telescope-conf')
        end,
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-file-browser.nvim" },
            { "nvim-telescope/telescope-project.nvim" },
            {
                "nvim-telescope/telescope-frecency.nvim",
                config = function()
                    require"telescope".load_extension("frecency")
                end,
                requires = {
                    { "kkharji/sqlite.lua" },
                }
            }
        },
    }

    -- git
    use {
        'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require('plugins/neogit-conf')
        end
    }

    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- use 'sainnhe/gruvbox-material'
    use 'lifepillar/vim-gruvbox8'

    -- org mode
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('plugins/org-mode')
        end
    }

    -- visual
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        config = function()
            -- disable netrw at the very start of your init.lua (strongly advised)
            vim.g.loaded = 1
            vim.g.loaded_netrwPlugin = 1

            -- empty setup using defaults
            require("nvim-tree").setup()

            -- OR setup with some options
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    adaptive_size = true,
                    mappings = {
                        list = {
                            { key = "u", action = "dir_up" },
                        },
                    },
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            })

            -- maps( "<leader>", "n", { "t", ":NvimTreeToggle" } )
        end
    }

    -- elimina el trailing whitespace solo de las lineas que uno haya modificado
    use { "axelf4/vim-strip-trailing-whitespace" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

