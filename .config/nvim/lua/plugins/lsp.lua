-- File: _mason-lspconfig.lua
return {

    'williamboman/mason.nvim',

    'williamboman/mason-lspconfig.nvim',

    {
        'neovim/nvim-lspconfig',

        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = { 'lua_ls', 'ts_ls', 'pyright' }

            }
            require('mason-lspconfig').setup_handlers {
                -- Default Handler for Language Servers installed by LSP
                function (server_name)
                    require("lspconfig")[server_name].setup {}

                end,

                ['lua_ls'] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { 'vim' }
                                }
                            }
                        }
                    }
                end,
            }


            -- LSP Keyboard Shortcuts
            vim.api.nvim_set_keymap('n', '<Leader>d', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = false })
            vim.api.nvim_set_keymap('n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = false })
            vim.api.nvim_set_keymap('n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = false })
        end,
    },
}
