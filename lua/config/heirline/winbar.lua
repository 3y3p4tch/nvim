local icons = require('nvim-web-devicons')
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')


local space = {
  provider = ' '
}

local bufnr = {
    provider = function(self)
        return tostring(self.bufnr) .. ')'
    end,
    hl = "Comment",
}

local fileicon = {
  init = function(self)
    local filetype = vim.api.nvim_buf_get_option(self.bufnr, "filetype")
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
  init = function(self)
    local path = vim.api.nvim_buf_get_name(self.bufnr)
    self.filename = vim.fn.fnamemodify(path, ':t')
    if self.filename == '' then self.filename = '[No Name]' end
  end,
  provider = function(self)
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

local buffer = {
  condition = function()
    return true
  end,
  bufnr,
  space,
  fileicon,
  space,
  filename,
  space,
  close,
  sep,
}

return {
  sep,
  utils.make_buflist(buffer)
}
