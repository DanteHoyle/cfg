return {
  'mason-org/mason-lspconfig.nvim',
  dependencies = {
    'mason-org/mason.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {
    ensure_installed = {
      'lua_ls',
      'pyright',
      -- 'ts_ls',
      -- 'jsonls',
      'eslint'
      -- 'tailwindcss',
      -- 'astro',
    },
    automatic_installation = true,
  },
}

-- return {
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       { 'williamboman/mason.nvim', config=true },
--       'williamboman/mason-lspconfig.nvim',
--     },
--     config = function()
--       local capabilities = vim.lsp.protocol.make_client_capabilities()
--       capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
--
--       require('mason').setup()
--       require('mason-lspconfig').setup({ 
--         handlers = {
--           ['pyright'] = function()
--             require('lspconfig').pyright.setup({
--               capabilities = capabilities,
--               settings = {
--                 python = {
--                   analysis = {
--                     typeCheckingMode = 'off'
--                   }
--                 }
--               }
--             })
--           end,
--           function(server_name)
--             require('lspconfig')[server_name].setup({ capabilities = capabilities })
--           end,
--         }
--       })
--     end,
--   },
--   {
--     'folke/lazydev.nvim',
--     ft = 'lua',
--     opts = {
--       library = {
--         -- Load luvit types when the `vim.uv` word is found
--         { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
--       },
--     },
--   },
--   {
--     'jpalardy/vim-slime',
--     init = function()
--       vim.g.slime_target = 'tmux'
--       vim.g.slime_default_config = {
--         socket_name = 'default',
--         target_pane = '{last}'
--       }
--     end
--   }
-- }
