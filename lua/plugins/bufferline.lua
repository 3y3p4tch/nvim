return {
  "akinsho/bufferline.nvim",
  event = 'UIEnter',
  opts = function()
    return require('config.bufferline')
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons'
  }
}
