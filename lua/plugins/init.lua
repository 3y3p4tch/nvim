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
    -- completion engine
    {
        'hrsh7th/nvim-cmp',
        event = { 'BufEnter' },
        config = function()
            require('config.cmp')
        end,
        dependencies = {
            -- LSP completion
            'hrsh7th/cmp-nvim-lsp',
            -- buffer completion
            'hrsh7th/cmp-buffer',
            -- path completion
            'hrsh7th/cmp-path',
            -- command-line completion
            'hrsh7th/cmp-cmdline',
            -- snippet plugin
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            -- for symbols on completion
            'onsails/lspkind.nvim'
        }
    },
    -- fuzzy finding
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.x',
        cmd = 'Telescope',
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
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-fzf-native.nvim'
        },
    },
    -- file manager
    {
        'nvim-tree/nvim-tree.lua',
        main = 'nvim-tree',
        event = 'UIEnter',
        config = function()
            require('script.nvim-tree')
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },
    -- LSP configurations
    {
        'neovim/nvim-lspconfig',
        event = { 'UIEnter', 'BufReadPost', 'BufNewFile' },
        config = function()
          require('config.lsp')
        end,
        dependencies = {
            -- mason plugin manager
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/nvim-cmp',
        }
    },
    -- Diagnostics
    {
        'folke/trouble.nvim',
        cmd = 'Trouble',
        opts = {},
        keys = function()
            return require('keymaps.trouble')
        end,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- snippets
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.x',
        build = 'make install_jsregexp',
    },
	-- auto pair highlighting
	{ 'windwp/nvim-autopairs', event = 'InsertEnter' },
	-- statusbar, winbar and bufferline
	{ 'rebelot/heirline.nvim', event = 'UIEnter' },
	-- terminal integration
	{
        'akinsho/toggleterm.nvim',
        event = 'VeryLazy',
        opts = function()
            return require('config.toggleterm')
        end,
    },
	-- debug adapter protocol
	{'mfussenegger/nvim-dap'},
	-- GIT
	{
        'lewis6991/gitsigns.nvim',
        event = 'VeryLazy',
        config = function()
            require('config.gitsigns')
        end
    },
	-- GIT TUI
	{
		'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
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
		event = 'VeryLazy',
		main = 'ibl',
		opts = function()
			return require('config.ibl')
		end,
	},
    -- todo comments
    {
        'folke/todo-comments.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
	-- -- formatting
	-- {'sbdchd/neoformat'},

    -- Themes
    {   
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        lazy = false
    },
    {
        "olimorris/onedarkpro.nvim",
        -- set this color-scheme as default
        config = function()
            vim.cmd.colorscheme('onedark')
        end,
        priority = 1000,
        lazy = false
    }
}
