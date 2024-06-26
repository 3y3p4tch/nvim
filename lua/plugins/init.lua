return {
  -- snippets
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.x',
    build = 'make install_jsregexp',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
    dependencies = { 'rafamadriz/friendly-snippets' }
  },
  -- debug adapter protocol
  { 'mfussenegger/nvim-dap' },
  -- GIT TUI
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  -- smooth scrolling
  { 'karb94/neoscroll.nvim', lazy = false },
  -- -- formatting
  -- {'sbdchd/neoformat'},
}
