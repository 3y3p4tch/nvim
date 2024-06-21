return {
  winbar = require('config.heirline.winbar'),
  --statusline = require('config.heirline.statusline'),
  --statuscolumn = require('config.heirline.statuscolumn'),
  opts = {
    disable_winbar_cb = function(args)
      return require('heirline.conditions').buffer_matches({
        buftype = { 'nofile', 'prompt', 'help', 'quickfix', 'terminal' },
      }, args.buf)
    end
  }
}
