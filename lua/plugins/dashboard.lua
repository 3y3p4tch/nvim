
-- General UI/UX
return {
  "nvimdev/dashboard-nvim",
  config = function() require("config.ui.dashboard") end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 999,
}
