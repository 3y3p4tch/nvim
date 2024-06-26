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

return M
