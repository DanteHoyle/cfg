-- File: telescope.lua

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Telescope
        vim.keymap.set('n', '<leader><leader>', function() require('telescope.builtin').builtin() end, { desc = 'Telescope' })
        vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').find_files() end, { desc = 'Telescope: Find Files' })
        vim.keymap.set('n', '<leader>d', function() require('telescope.builtin').lsp_definitions() end, { desc = 'Telescope: Git [S]tatus' })
        vim.keymap.set('n', '<leader>h', function() require('telescope.builtin').help_tags({jump_type='tab'}) end, { desc = 'Telescope: Vim [H]elp' })
        vim.keymap.set('n', '<leader>s', function() require('telescope.builtin').git_status() end, { desc = 'Telescope: Git [S]tatus' })
        vim.keymap.set('n', '<leader>b', function() require('telescope.builtin').buffers() end, { desc = 'Telescope: Open [B]uffers' })
        vim.keymap.set('n', '<leader>D', function() require('telescope.builtin').lsp_type_definitions() end, { desc = 'Telescope: Type [D]efinition' })
    end
}
