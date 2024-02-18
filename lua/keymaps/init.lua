-- all keymaps will be listed in this file

local n, i, v, t = 'n', 'i', 'v', 't'
local all = {n, i, v, t}

local function map(mode, key, command)
    local options = { noremap = true, silent = true }
    if type(mode) == 'table' then
        for _, m in ipairs(mode) do
            vim.api.nvim_set_keymap(m, key, command, options)
        end
    else
        vim.api.nvim_set_keymap(mode, key, command, options)
    end
end

-- typical mappings
map(n, '<tab>', '<CMD>bnext<CR>')
map(n, '<s-tab>', '<CMD>bprev<CR>')
-- nvim-tree
map(all, '<c-b>', '<CMD>NvimTreeToggle<CR>')
-- telescope
map(all, '<c-p>', '<CMD>Telescope find_files<CR>')
map(all, '<c-f>', '<CMD>Telescope current_buffer_fuzzy_find previewer=false<CR>')
map(all, '<c-s-f>', '<CMD>Telescope live_grep<CR>')
