local icons = require('nvim-web-devicons')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local winbar = require('config.ui.winbar')
local bufutils = require('util.buffers')

local space = {
  provider = ' '
}

local bufnr = {
  provider = function(self)
    return tostring(self.bufnr) .. ')'
  end,
  hl = 'Comment',
}

local fileicon = {
  init = function(self)
    local filetype = vim.api.nvim_buf_get_option(self.bufnr, 'filetype')
    self.icon, self.icon_hl = icons.get_icon_by_filetype(filetype)
  end,
  provider = function(self)
    return self.icon
  end,
  hl = function(self)
    return self.icon_hl
  end
}

local filename = {
  provider = function(self)
    if self.filename == '' then
      return 'Untitled'
    end
    return self.filename
  end
}

local close = {
  init = function(self)
    self.modified = vim.api.nvim_buf_get_option(self.bufnr, 'modified')
  end,
  provider = function(self)
    if self.modified then
      return ''
    else
      return ''
    end
  end,
}

local sep = {
  provider = "│"
}

local unique_path = {
  provider = function(self)
    local sep = ''
    local ret = ''
    local depth = 0
    local path_parts = nil
    local num_parts = 0
    for  _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(bufnr) then
        local other_filename = bufutils.filename(bufnr)
        if other_filename ~= '' and other_filename == self.filename and bufnr ~= self.bufnr then
          if path_parts == nil then
            path_parts = bufutils.path_parts(self.bufnr)
            num_parts = #path_parts
          end
          local other = bufutils.path_parts(bufnr)
          for i = 1, num_parts do
            if path_parts[num_parts - i + 1] ~= other[num_parts - i + 1] then
              depth = math.max(i, depth)
              break
            end
          end
        end
      end
    end
    for i = 1, depth do
      ret = ret .. path_parts[num_parts + i - depth] .. sep
    end
    return ret
  end,
  hl = 'Comment'
}

local buffer = {
  init = function(self)
    self.filename = bufutils.filename(self.bufnr)
  end,
  condition = function()
    return true
  end,
  hl = function(self)
    if self.is_active then
      return 'TabLineSel'
    else
      return 'TabLine'
    end
  end,
  --  bufnr,
  --  space,
  fileicon,
  space,
  unique_path,
  filename,
  space,
  close,
}

return {
  utils.make_buflist(buffer,
    {
      provider = '',
    },
    {
      provider = '',
    }
--    function()
--      return winbar.buffers(vim.api.nvim_get_current_win())
--    end
  ),
}
