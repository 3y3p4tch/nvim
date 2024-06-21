-- LSP configurations
return {
  'neovim/nvim-lspconfig',
  event = { 'UIEnter', 'BufReadPost', 'BufNewFile' },
  config = function()
    require('config.lsp')
  end,
  dependencies = {
    -- mason plugin manager
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
  }
}
