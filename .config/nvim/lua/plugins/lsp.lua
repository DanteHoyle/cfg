-- File: lsp.lua
-- This contains Language Server Configuration

return {

    'neovim/nvim-lspconfig', lazy = false,
    dependencies = { 'williamboman/mason.nvim' },

    config = function()
        require('mason').setup()
        -- require('mason-lspconfig').setup()
        vim.diagnostic.config({
            signs=false
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME }
                    }
                },
            },
        }
        lspconfig.ruff.setup {
            capabilities = capabilities,
        }
        lspconfig.basedpyright.setup {
            capabilities = capabilities,
            settings = {
                basedpyright = {
                    disableOrganizeImports = true,
                    typeCheckingMode = 'none',
                    analysis = {
                        ignore = { '*' }
                    }
                }
            }
        }
    end,
}
