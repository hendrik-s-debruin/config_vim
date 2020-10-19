" This file sets the general appearance of the editor

syntax on
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

highlight SpellBad ctermbg=232 ctermfg=202
