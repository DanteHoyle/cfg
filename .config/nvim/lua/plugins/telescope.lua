return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- Telescope
        local telescope = require('telescope.builtin')
        vim.keymap.set('n', '<Leader><Leader>', function() telescope.builtin() end)
        vim.keymap.set('n', '<C-p>', function() telescope.find_files() end)
        vim.keymap.set('n', '<C-f>', function() telescope.current_buffer_fuzzy_find() end)
        vim.keymap.set('n', '<C-k>', function() telescope.live_grep() end)
        vim.keymap.set('n', '<Leader>d', function() telescope.lsp_definitions() end)
        vim.keymap.set('n', '<Leader>vh', function() telescope.help_tags({jump_type='tab'}) end)
        vim.keymap.set('n', '<Leader>s', function() telescope.git_status() end)
        vim.keymap.set('n', '<Leader>b', function() telescope.buffers() end)
    end
}
