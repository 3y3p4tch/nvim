-- indentation guides
return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  main = 'ibl',
  opts = function()
    return require('config.ibl')
  end,
}
