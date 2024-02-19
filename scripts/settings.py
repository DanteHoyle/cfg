import os
# Constants
# sets HOME to the path of the users home directory 
HOME = os.path.expanduser('~')
# sets CONFIG to the path of the git directory by going backwards from the 
# script file ../dotfiles/scripts/push_config.py
CONFIG = os.path.dirname(os.path.dirname(__file__))

# does not do anything currently
VERBOSE = False

# does not do anything currently
DEBUG = False

# Other scripts rely on this dictionary to keep track of where files should go
PROGRAMS = {
    'fish':
    {
        'file': 'config.fish',
        'path': f'{HOME}/.config/fish',
        'make_hidden': False
    },
    'vim':
    {
        'file': 'vimrc',
        'path': f'{HOME}/.vim',
        'make_hidden': False
    },
    'tmux':
    {
        'file': 'tmux.conf',
        'path': HOME,
        'make_hidden': True
    },
    'foot':
    {
        'file': 'foot.ini',
        'path': f'{HOME}/.config/foot',
        'make_hidden': False
    },
    'kitty':
    {
        'file': 'kitty.conf',
        'path': f'{HOME}/.config/kitty',
        'make_hidden': False
    }
}