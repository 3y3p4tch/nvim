-- fuzzy finding
return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.x',
  cmd = 'Telescope',
  opts = function()
    return require('config.telescope')
  end,
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)
    telescope.load_extension('fzf')
    telescope.load_extension('frecency')
    require('script.keymap').register('keymaps.telescope')
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-frecency.nvim'
  },
}
