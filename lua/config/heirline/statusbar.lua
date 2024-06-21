local mode = {
  -- get vim mode
  init = function(self)
    self.mode = vim.fn.mode(1)
  end,
}
