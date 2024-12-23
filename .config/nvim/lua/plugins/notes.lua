return {
    {
        'dhruvasagar/vim-table-mode',
        ft = { 'org', 'md', 'txt' },
    },
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
            org_tag_column = 0,
            win_split_mode = 'vsplit',
            mappings = {
                org_return_uses_meta_return = true,
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
}
