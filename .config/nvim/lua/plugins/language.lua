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
                    { name = 'vsnip' },
                    { name = 'nvim_lsp_signature_help' },
                }, {
                    { name = 'buffer' },
                })
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
            require('mason-lspconfig').setup()

            local capabilities = vim.lsp.protocol.make_client_capabilities()

            require('lspconfig').pyright.setup { capabilities }

            require('lspconfig').ts_ls.setup { capabilities }

            require('lspconfig').lua_ls.setup { capabilities }

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
