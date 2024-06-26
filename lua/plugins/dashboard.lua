
-- General UI/UX
return {
  "glepnir/dashboard-nvim",
  config = function() require("alex.plugins.ui.dashboard") end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 999,
}