" This file sets general editor behaviour

filetype plugin indent on
set autoindent
set nowrap
set mouse=a
set incsearch
set spelllang=en_gb
set textwidth=80

set formatoptions=""
set formatoptions+=c " autowrap comments at text width
set formatoptions+=q " alow formatting of comments with gq
set formatoptions+=j " remove leader when joining with j
set formatoptions+=r " auto continue comments on next line

set foldmethod=syntax
set nofoldenable

set tabstop=4
set shiftwidth=4

" Command line completion
set nowildmenu
set wildmode=list:full
