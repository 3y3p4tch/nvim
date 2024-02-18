return {
    -- insert mode
    i = {
        ['<c-p>'] = '<CMD>Telescope find_files<CR>',
    },
    -- normal mode
    n = {
        ['<c-p>'] = '<CMD>Telescope find_files<CR>',
        ['<leader>ff'] = '<CMD>Telescope find_files<CR>',
        ['<leader>fg'] = '<CMD>Telescope live_grep<CR>',
        ['<leader>fb'] = '<CMD>Telescope buffers<CR>',
        ['<leader>fh'] = '<CMD>Telescope help_tags<CR>',
    },
}
