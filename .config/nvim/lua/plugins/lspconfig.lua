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
      'ts_ls',
      'eslint',
      'jsonls',
      'tailwindcss',
      'clangd'
    },
    automatic_installation = true,
  },
}
