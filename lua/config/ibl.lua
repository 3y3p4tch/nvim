return {
    -- General options
    enabled = true,
    indent = {
        char = '▏',
        tab_char = '',
    },
    scope = {
        enabled = false,
    },
    exclude = {
        buftypes = {'terminal'},
        filetypes = {
            'help',
            'terminal',
            'lazy',
            'lspinfo',
            'TelescopePrompt',
            'TelescopeResults',
        },
    },
}
