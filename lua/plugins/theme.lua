-- Themes
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
  },
  {
    'olimorris/onedarkpro.nvim',
    -- set this color-scheme as default
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
    priority = 1000,
    lazy = false
  }
}
