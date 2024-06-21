-- file manager
return {
  'nvim-tree/nvim-tree.lua',
  main = 'nvim-tree',
  event = 'UIEnter',
  config = function()
    require('script.nvim-tree')
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
