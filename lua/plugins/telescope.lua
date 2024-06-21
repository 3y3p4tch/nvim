-- fuzzy finding
return {
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
}
