" This file sets the general appearance of the editor

syntax on

" Get true-color support for terminal in alacritty.
" See this issue:
" https://github.com/alacritty/alacritty/issues/109
set termguicolors
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"

set ruler
set showcmd
set hlsearch
set breakindent
set linebreak
set display=lastline
set colorcolumn=+1
set conceallevel=0
set list lcs=tab:│\ 

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

augroup highlightcursorline
	autocmd!
	autocmd VimEnter,WinEnter * set cursorline
	autocmd WinLeave * set nocursorline
augroup END

highlight SpellBad guifg=#cc241d cterm=underline,italic
