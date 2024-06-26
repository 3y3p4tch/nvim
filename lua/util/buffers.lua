local conditions = require('heirline.conditions')

local M = {}

function M.filename(bufnr)
  return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ':t')
end

function M.path_parts(bufnr)
  local path = vim.api.nvim_buf_get_name(bufnr)
  path = vim.fn.fnamemodify(path, ':h') .. '/'
  local ret = {}
  for match in path:gmatch('(.-)/') do
    table.insert(ret, match)
  end
  return ret
end

function M.invalid_buffer(bufnr)
  return conditions.buffer_matches({
    buftype = { 'prompt', 'help', 'quickfix', 'terminal' },
    filetype = { 'NvimTree', 'Trouble' }
  }, bufnr)
end

function M.add_buffer(winId, bufnr)
  local buffers = vim.api.nvim_win_get_var(winId, 'buffers')
  buffers[bufnr] = true
  vim.api.nvim_win_set_var(winId, 'buffers', buffers)
end

function M.remove_buffer(winId, bufnr)
  local buffers = vim.api.nvim_win_get_var(winId, 'buffers')
  buffers[bufnr] = nil
  vim.api.nvim_win_set_var(winId, 'buffers', buffers)
end

function M.buffers(winId)
  local ret = {}
  local ok, buffers = pcall(vim.api.nvim_win_get_var, winId, 'buffers')
  if not ok then
    return ret
  end
  for bufnr, _ in pairs(buffers) do
    table.insert(ret, bufnr)
  end
  return ret
end

function M.inspect(winId)
  if winId == nil then
    winId = vim.api.nvim_get_current_win()
  end
  print(vim.inspect(vim.api.nvim_win_get_var(winId, 'buffers')))
end

function M.setup()
  local augroup = vim.api.nvim_create_augroup('winscoped-buffers', {})

  vim.api.nvim_create_autocmd({ 'VimEnter', 'WinNew' }, {
    group = augroup,
    callback = function()
      local winId = vim.api.nvim_get_current_win()
      vim.api.nvim_win_set_var(winId, 'buffers', {})
    end
  })

  vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
    group = augroup,
    callback = function(args)
      if M.invalid_buffer(args.buf) then
        return
      end
      local winId = vim.api.nvim_get_current_win()
      M.add_buffer(winId, args.buf)
      vim.api.nvim__redraw({win = winId, winbar = true})
    end
  })
end

return M
