-- leap motion
return {
  'ggandor/leap.nvim',
  keys = { 's', 'S' },
  dependencies = { 'tpope/vim-repeat' },
  config = function()
    require('leap').create_default_mappings()
  end,
  lazy = false,
}
