-- File: lsp.lua

return {
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = 'luvit-meta/library', words = { 'vim%.uv' } },
            },
        },
    },
    { 'Bilal2453/luvit-meta', lazy = true },
    { -- LSP Config
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config=true },
            'williamboman/mason-lspconfig.nvim',
            { "j-hui/fidget.nvim", opts = {} },
            -- Allows extra capabilitess provided by nvim-cmp
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            require('mason').setup()
            require("mason-lspconfig").setup {
                ensure_installed = { 'lua_ls', 'pyright' },
            }

            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        diagnostics = { disable = { 'missing-fields' } },
                    },
                }
            }

            lspconfig.pyright.setup {
                capabilities = capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'none'
                        }
                    }
                }
            }
        end,
    },
}
