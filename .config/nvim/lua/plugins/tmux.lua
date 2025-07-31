return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
    'TmuxNavigatePrevious',
  },
  keys = {
    { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate Left (TmuxNavigator)' },
    { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate Down (TmuxNavigator)' },
    { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate Up (TmuxNavigator)' },
    { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate Right (TmuxNavigator)' },
    { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate Previous (TmuxNavigator)' },
  },
}
