-- terminal integration
return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec' },
  opts = function()
    return require('config.toggleterm')
  end,
}
