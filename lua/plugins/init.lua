return {
    -- key help
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = function()
            return require('config.which-key')
        end
    },
    -- syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        event = { 'BufReadPost', 'BufNewFile' },
        cmd = { 'TSInstall', 'TSInstallSync', 'TSInstallInfo', 'TSUpdate', 'TSUpdateSync', 'TSBufEnable', 'TSBufDisable', 'TSBufToggle', 'TSModuleInfo' },
        build = ':TSUpdate',
        opts = function()
            return require('config.treesitter')
        end,
        main = 'nvim-treesitter.configs',
    },
    -- autocompletions
    -- {'ms-jpq/coq_nvim'},
    -- snippets
    { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
    -- fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        opts = function()
            return require('config.telescope')
        end,
        config = function(_, opts)
            require('telescope').setup(opts)
            require('script.keymap').register('keymaps.telescope')
        end,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    },
    -- file manager
    {
		'ms-jpq/chadtree',
		build = 'python3 -m chadtree deps',
		lazy = false,
        config = function()
            require('script.chadtree')
        end,
        optional = true,
	},
    -- file manager
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        main = 'nvim-tree',
        config = function()
            require('script.nvim-tree')
        end,
        lazy = false
    },
	-- devicons
	{ 'nvim-tree/nvim-web-devicons' },
	-- auto pair highlighting
	{ 'windwp/nvim-autopairs', event = 'InsertEnter' },
	-- statusbar, winbar and bufferline
	{ 'rebelot/heirline.nvim', event = 'UiEnter' },
	-- terminal integration
	{
        'akinsho/toggleterm.nvim',
        opts = function()
            return require('config.toggleterm')
        end,
    },
	-- debug adapter protocol
	{'mfussenegger/nvim-dap'},
	-- git integration
	{'lewis6991/gitsigns.nvim'},
	-- lazy git
	{
		'kdheepak/lazygit.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
	},
	-- leap motion
	{
		'ggandor/leap.nvim',
		dependencies = {'tpope/vim-repeat'},
		config = function()
			require('leap').create_default_mappings()
		end,
		lazy = false,
	},
	-- smooth scrolling
	{'karb94/neoscroll.nvim', lazy = false },
	-- indentation guides
	{
		'lukas-reineke/indent-blankline.nvim',
		event = {'BufEnter'},
		main = 'ibl',
		opts = function()
			return require('config.ibl')
		end,
	},
	-- formatting
	{'sbdchd/neoformat'},
}
