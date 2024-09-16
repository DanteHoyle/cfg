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
                                    globals = { 'vim' },
                                },
                            },
                        },
                    }
                end,

                ['pyright'] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.pyright.setup {
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode = "basic",
                                    diagnosticSeverityOverrides = {
                                        reportInvalidStringEscapeSequence = "none",
                                        reportPossiblyUnboundVariable = "none",
                                    },
                                },
                            },
                        },
                    }
                end,
            }
        end,
    }
}
