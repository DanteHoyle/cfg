-- File: lsp.lua
-- This contains Language Server Configuration

return {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    {
        'neovim/nvim-lspconfig',

        keys = {
            { '<Leader>d', ':split | lua vim.lsp.buf.definition()<CR>' },
            { '<Leader>n' , 'lua vim.diagnostic.goto_next()<CR>' },
            { '<Leader>p' , 'lua vim.diagnostic.goto_prev()<CR>' },
            { '<Leader>y' , 'lua vim.lsp.buf.rename()<CR>' },
        },

        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = { 'lua_ls', 'ts_ls', 'pyright', 'bashls' }

            }
            require('mason-lspconfig').setup_handlers {
                -- Default Handler for Language Servers installed by LSP
                function (server_name)
                    local capabilities = require('cmp_nvim_lsp').default_capabilities()
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                -- Other Handlers
                ['lua_ls'] = function()
                    local lspconfig = require('lspconfig')
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                workspace = {
                                    checkThirdParty = false,
                                    library = { vim.env.VIMRUNTIME }
                                }
                            },
                        },
                    }
                end,

                ['pyright'] = function()
                    local capabilities = require('cmp_nvim_lsp').default_capabilities()
                    local lspconfig = require('lspconfig')
                    lspconfig.pyright.setup {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                venvPath =  ".",
                                venv = ".venv",
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
            auto_install = true,
            ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "python", "bash", "html",
                "markdown", "markdown_inline", "javascript", "typescript"
            },

            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
            }
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
            autofold = { "python", "lua" }
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
