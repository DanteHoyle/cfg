return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config=true },
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            require('lspconfig').pyright.setup { capabilities }

            require('lspconfig').ts_ls.setup { capabilities }

            require('lspconfig').lua_ls.setup { capabilities }

            require('lspconfig').cssls.setup { capabilities }

            require('lspconfig').html.setup { capabilities }

            end,
        },
        {
            -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    -- Load luvit types when the `vim.uv` word is found
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
    }
