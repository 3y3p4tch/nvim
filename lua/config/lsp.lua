require('mason').setup()
require('mason-lspconfig').setup({
    -- don't provide clangd here, so that we can use system installed clangd
    ensure_installed = { 'cmake', 'lua_ls', 'rust_analyzer' }
})

local lsp = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- C/C++
lsp.clangd.setup({
    capabilities = capabilities
})
-- cmake
lsp.cmake.setup({
    capabilities = capabilities
})
-- lua
lsp.lua_ls.setup({
    capabilities = capabilities
})
-- rust
lsp.rust_analyzer.setup({
    capabilities = capabilities
})

-- disable linting on every file
vim.diagnostic.config({
    virtual_text = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '',
        }
    }
})