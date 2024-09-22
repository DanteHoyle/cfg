-- File: lsp.lua
-- This contains Language Server Configuration

return {

    'williamboman/mason.nvim',

    'williamboman/mason-lspconfig.nvim',

    {
        'neovim/nvim-lspconfig',

        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = { 'lua_ls', 'ts_ls', 'pyright', 'bashls' }

            }
            require('mason-lspconfig').setup_handlers {
                -- Default Handler for Language Servers installed by LSP
                function (server_name)
                    require("lspconfig")[server_name].setup {}
                end,

                -- Other Handlers
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
                                    typeCheckingMode = "off",
                                },
                            },
                        },
                    }
                end,
            }
        end,
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "python", "bash", "html",
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "python",
                callback = function()
                    vim.wo.foldmethod = 'expr'
                    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                end,
            })

        end,
    },
}
