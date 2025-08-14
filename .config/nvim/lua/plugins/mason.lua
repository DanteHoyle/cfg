return {
  {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
    cmd = {
      'Mason',
      'MasonInstall',
      'MasonUninstall',
      'MasonUninstallAll',
      'MasonLog',
    },
    opts = {}
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    opts = {
      ensure_installed = {
        'pyright',
        'lua_ls',
        'ts_ls',
        'jsonls',
        'clangd'
      },
      automatic_installation = true,
    },
  }
}
