-- syntax highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = { 'TSInstall', 'TSInstallSync', 'TSInstallInfo', 'TSUpdate', 'TSUpdateSync', 'TSBufEnable', 'TSBufDisable', 'TSBufToggle', 'TSModuleInfo' },
  build = ':TSUpdate',
  opts = function()
    return require('config.treesitter')
  end,
  main = 'nvim-treesitter.configs'
}
