local M = {}

-- add the current buffer to window-specific list
function M.add_buffer(bufnr)
  local buffers = vim.api.nvim_win_get_var(0, 'open_buffers')
  buffers[bufnr] = true
  vim.api.nvim_win_set_var(0, 'open_buffers', buffers)
end

-- remove the current buffer from window-specific list
function M.remove_buffer(bufnr)
  local buffers = vim.api.nvim_win_get_var(0, 'open_buffers')
  buffers[bufnr] = nil
  vim.api.nvim_win_set_var(0, 'open_buffers', buffers)
end

function M.get_buffers()
  return vim.api.nvim_win_get_var(0, 'open_buffers')
end

vim.api.nvim_create_user_command('WindowBuffers', function()
  print(vim.inspect(vim.api.nvim_win_get_var(0, 'open_buffers')))
end, {})

vim.api.nvim_create_autocmd('WinNew', {
  callback = function()
    vim.api.nvim_win_set_var(0, 'open_buffers', {})
  end
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  callback = function()
    M.add_buffer(vim.api.nvim_get_current_buf())
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  callback = function()
    M.remove_buffer(vim.api.nvim_get_current_buf())
  end
})

return M
