-- Diagnostics
return {
  'folke/trouble.nvim',
  cmd = 'Trouble',
  opts = {},
  keys = function()
    return require('keymaps.trouble')
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
