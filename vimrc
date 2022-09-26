" vimrc
" Source / Inspiration https://vim.fandom.com/wiki/Example_vimrc
set nocompatible

if has('filetype')
	filetype indent plugin on
endif

if has('syntax')
	syntax on
endif

set hidden

set wildmenu

set showcmd

set ignorecase
set smartcase

set backspace=indent,eol,start

set autoindent

set nostartofline

" Hybrid line numbers 
set number relativenumber
set nu rnu

" Visual bell instead of annoying beeping
set visualbell

" Raises dialog confirming you want to save instead of failing
set confirm

if has('mouse')
	set mouse=a
endif

set cmdheight=2


" Indentation
set shiftwidth=4
set softtabstop=4
set expandtab
