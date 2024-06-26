-- completion engine
return {
  'hrsh7th/nvim-cmp',
  event = { 'BufEnter' },
  config = function()
    require('config.cmp')
  end,
  dependencies = {
    -- LSP completion
    'hrsh7th/cmp-nvim-lsp',
    -- buffer completion
    'hrsh7th/cmp-buffer',
    -- path completion
    'hrsh7th/cmp-path',
    -- command-line completion
    'hrsh7th/cmp-cmdline',
    -- snippet plugin
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    -- for symbols on completion
    'onsails/lspkind.nvim',
  }
}
