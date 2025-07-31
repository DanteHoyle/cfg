local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Add nvim-cmp capabilities
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

vim.lsp.config("*", {
  capabilities = capabilities
})
