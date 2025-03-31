return {
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp', lazy = true },
            { 'hrsh7th/cmp-buffer', lazy = true },
            { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
            { 'hrsh7th/cmp-path', lazy = true },
            { 'hrsh7th/cmp-nvim-lua', lazy = true },
            { 'hrsh7th/vim-vsnip', lazy = true },
            { 'hrsh7th/cmp-cmdline', lazy = true },
            { 'hrsh7th/cmp-vsnip', lazy = true },
        },

        config = function()
            local cmp = require'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'vsnip' }, -- For vsnip users.
                }, {
                    { name = 'buffer' },
                })
            })

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                    { name = 'cmdline' }
                }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })
        end
    },
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
