return {
    -- insert mode
    i = {
        ['<c-p>'] = '<CMD>Telescope frecency workspace=CWD<CR>',
    },
    -- normal mode
    n = {
        ['<c-p>'] = '<CMD>Telescope frecency workspace=CWD<CR>',
        ['ff'] = '<CMD>Telescope find_files<CR>',
        ['fg'] = '<CMD>Telescope live_grep<CR>',
        ['fb'] = '<CMD>Telescope buffers<CR>',
        ['fh'] = '<CMD>Telescope help_tags<CR>',
    },
}
