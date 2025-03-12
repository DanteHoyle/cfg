-- File: cmp.lua

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

return {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
        'neovim/nvim-lspconfig',
        { 'hrsh7th/cmp-nvim-lsp', lazy = true },
        { 'hrsh7th/cmp-buffer', lazy = true },
        { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
        { 'hrsh7th/cmp-path', lazy = true },
        { 'hrsh7th/cmp-cmdline', lazy = true },
        { 'hrsh7th/cmp-vsnip', lazy = true },
        { 'hrsh7th/vim-vsnip', lazy = true },
    },
    config = function()
        local cmp = require('cmp')
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn['vsnip#anonymous'](args.body)
                    --vim.snippet.expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-d>'] = cmp.mapping.open_docs(),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif vim.fn['vsnip#available'](1) == 1 then
                        feedkey('<Plug>(vsnip-expand-or-jump)', '')
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function()
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
                        feedkey('<Plug>(vsnip-jump-prev)', '')
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'vsnip' },
                { name = 'orgmode' },
            }, {
                    { name = 'buffer' },
                    { name = 'nvim_lua' },
                    { name = 'path' },
                }
            ),
        })
        -- `/` cmdline setup.
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                { { name = 'buffer' } }
            )
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources(
                {
                    { name = 'path' },
                },
                {
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' },
                        },
                    }
                }
            ),
        })

        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )
    end,
}
