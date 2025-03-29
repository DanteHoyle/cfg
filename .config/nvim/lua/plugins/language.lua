return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', config=true },
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup {
                ensure_installed = { 'lua_ls', 'pyright', 'ts_ls' },
            }

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            require('lspconfig').pyright.setup {
                capabilities,
                settings = {
                    python = {
                        analysis = {
                            typeCheckingMode = 'off',
                        }
                    },
                }
            }

            require('lspconfig').ts_ls.setup {
                capabilities,
            }

            require('lspconfig').lua_ls.setup {
                capabilities,
            }

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('MyLspAttach', { clear = true }),
                callback = function(event)
                    -- Small helper function to map keys to telescope functions
                    local map = function(keys, func, desc, mode)
                        mode = mode or 'n'
                        vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
                    end

                    local builtin = require('telescope.builtin')

                    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
                    map('gr', builtin.lsp_references, '[G]oto [R]eferences')
                    map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
                    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
                    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
                end})
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
