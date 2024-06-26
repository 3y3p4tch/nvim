local timestamp = {}

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    timestamp[bufnr] = os.time()
  end
})

vim.api.nvim_create_autocmd({ 'BufDelete' }, {
  callback = function(ev)
    timestamp[ev.buf] = nil
  end,
})

return {
  options = {
    --separator_style = "slope",
    diagnostics = 'nvim_lsp',
    --sort_by = function(buffer_a, buffer_b)
    --  return timestamp[buffer_a.id] > timestamp[buffer_b.id]
    --end,
    numbers = function(opts)
      return opts.raise(opts.id)
    end,
    indicator = {
      style = 'underline',
    },
    hover = {
      enabled = true,
      reveal = { 'close' }
    }
  }
}
