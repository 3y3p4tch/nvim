-- statusbar, winbar and bufferline
return {
  'rebelot/heirline.nvim',
  event = 'UIEnter',
  opts = function()
    return require('config.heirline')
  end,
  dependencies = {
    -- for winbar
    'nvim-tree/nvim-web-devicons'
  }
}