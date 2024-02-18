vim.opt.encoding = 'UTF-8'

-- Highlight current line where the cursor is
vim.opt.cursorline = true

-- Indenting vim.options
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Number of spaces for each indentation level
vim.opt.smartindent = true      -- Automatically adjust indentation based on context
vim.opt.tabstop = 4             -- Number of spaces a tab counts for
vim.opt.softtabstop = 4         -- Number of spaces inserted for a tab keypress

-- Ignore case in searches
vim.opt.ignorecase = true

-- Enable smartcase: case-sensitive if search contains uppercase characters
vim.opt.smartcase = true

-- Display line numbers
vim.opt.number = true

-- Set the width of line numbers to 2 characters
vim.opt.numberwidth = 2

-- Enable true color support in the terminal
vim.opt.termguicolors = true

-- set leader to comma
vim.g.mapleader = ' '

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- use catppuccin-frappe color scheme
vim.api.nvim_create_autocmd({'VimEnter'}, {
    callback=function(ev)
        vim.cmd.colorscheme('catppuccin')
    end
})
