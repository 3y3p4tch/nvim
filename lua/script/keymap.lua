local M = {}

function M.map(keymap_table, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    -- Set key mappings
    for mode, keymaps in pairs(keymap_table) do
        for key, value in pairs(keymaps) do
            vim.api.nvim_set_keymap(mode, key, value, options)
        end
    end
end

-- unmap all the keybindings in a lua-table
function M.unmap(keymap_table)
    -- Set key mappings
    for mode, keymaps in pairs(keymap_table) do
        for key, value in pairs(keymaps) do
            vim.api.nvim_del_keymap(mode, key)
        end
    end
end

-- Register function
function M.register(keymap_table, opts, buffer_regex)
    -- load key mappings from file
    if type(keymap_table) == 'string' then
        keymap_table = require(keymap_table)
    end
    if not buffer_regex then
        M.map(keymap_table, opts)
    else
        -- create mappings on BufEnter
        vim.api.nvim_create_autocmd('BufEnter', {pattern = buffer_regex, callback = function() M.map(keymap_table, opts) end})
        -- remove mappings on BufLeave
        vim.api.nvim_create_autocmd('BufLeave', {pattern = buffer_regex, callback = function() M.unmap(keymap_table, opts) end})
    end
end

return M
