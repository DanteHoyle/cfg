return {
    {
        'nvim-orgmode/orgmode',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        event = 'VeryLazy',
        ft = { 'org' },
        opts = {
            org_agenda_files = '~/notes/**/*',
            org_default_notes_file = '~/notes/todos.org',
            org_log_into_drawer = 'LOGBOOK',
            org_startup_indented = true,
            -- org_startup_folded = 'showeverything',
            -- org_startup_indented = true,
            win_split_mode = 'vsplit',
            mappings = {
                org = {
                    org_toggle_checkbox = '<Leader>o<cr>'
                }
            }
        },
    },
    {
        'nvim-orgmode/org-bullets.nvim',
        event = 'VeryLazy',
        dependencies = 'nvim-orgmode/orgmode',
        opts = {},
        -- enabled = false,
    },
    -- init.lua
    {
        'lukas-reineke/headlines.nvim',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        config = true, -- or `opts = {}`
        enabled = false,
    },
    {
        'michaelb/sniprun',
        branch = 'master',
        build = 'sh install.sh',
        event = 'LspAttach',
        keys = {
            { '<leader>r', ':SnipRun<cr>', mode = 'v', desc = 'Run Selection with SnipRun' },
            { '<leader>R', ':SnipRun<cr>', mode = 'n', desc = 'Close SnipRun' }
        },
        opts = {}
    },
    {'ellisonleao/glow.nvim', config = true, cmd = 'Glow'},
}
