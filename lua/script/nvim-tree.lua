local api = require("nvim-tree.api")

-- edit or open the current file
local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
    -- close the tree if file was opened
    api.tree.close()
  end
end

-- setup nvim-tree
require('nvim-tree').setup()

-- setup keybindings
require('script.keymap').register('keymaps.nvim-tree')
