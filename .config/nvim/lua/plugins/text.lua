-- File: text.lua
-- This holds configuration for plugins related to text editing

return {
    -- Nvim-cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            -- Completion Sources
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            -- Snipping Engine
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = function()
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                window = {
                    -- completion = cmp.config.window.bordered(),
                    -- documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-e>"] = cmp.mapping.abort(),
                    -- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-d>"] = cmp.mapping.open_docs(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, {"i","s","c",}),
                }),
                sources = cmp.config.sources(
                {
                    { name = "nvim_lsp" },
                    { name = "vsnip" },
                    { name = "neorg" },
                    { name = "path" },
                },
                {
                    { name = "buffer" },
                }),
            })
        end,
    },
    -- Autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        opts = {},
    }
}

