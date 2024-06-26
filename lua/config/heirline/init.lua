return {
  winbar = require('config.heirline.winbar'),
  --statusline = require('config.heirline.statusline'),
  --statuscolumn = require('config.heirline.statuscolumn'),
  opts = {
    disable_winbar_cb = function(args)
      return require('util.buffers').invalid_buffer(args.buf)
    end
  }
}
