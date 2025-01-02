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
    { 'Bilal2453/luvit-meta' },
    { -- LSP Config
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config=true },
            'williamboman/mason-lspconfig.nvim',
            { 'j-hui/fidget.nvim', opts = {} },
            'mfussenegger/nvim-lint',
            -- 'rshkarin/mason-nvim-lint',
        },

        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = { 'lua_ls', 'pyright' },
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }

            require('lspconfig').lua_ls.setup {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            }

            -- require('lspconfig').ruff.setup({
            --     capabilities = capabilities
            -- })

            require('lspconfig').pyright.setup {
                capabilities = capabilities,
                settings = {
                    pyright = {
                        -- disableTaggedHints = true,
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            ignore = { '*' },
                        },
                    },
                },
            }

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
                callback = function(args)
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    if client == nil then
                        return
                    end
                    if client.name == 'ruff' then
                        -- Disable hover in favor of Pyright
                        client.server_capabilities.hoverProvider = false
                    end
                end,
                desc = 'LSP: Disable hover capability from Ruff',
            })
        end,
    },
}
