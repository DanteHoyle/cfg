return {
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  { 'windwp/nvim-ts-autotag', event = "InsertEnter", config = true },
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
      local cmp = require('cmp')
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')

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
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'nvim_lsp_signature_help' },
        }, {
            { name = 'buffer' },
          })
      })
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end
  },
}
