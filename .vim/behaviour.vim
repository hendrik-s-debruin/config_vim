" This file sets general editor behaviour

filetype plugin indent on
set autoindent
set nowrap
set mouse=a
set incsearch
set spelllang=en_gb
set textwidth=80
set nowrapscan

set formatoptions=""
set formatoptions+=c " autowrap comments at text width
set formatoptions+=q " alow formatting of comments with gq
set formatoptions+=j " remove leader when joining with j
set formatoptions+=r " auto continue comments on next line

set foldmethod=marker

set tabstop=4
set shiftwidth=4

" Command line completion
set nowildmenu
set wildmode=list:full

" Automatically activate a python virtual environment when editing the file if
" that environment is not yet active
let g:auto_venv_enable = 1
function s:AutoVenv()
	if !g:auto_venv_enable
		return
	endif
	" Get directory name of current file
	let s:dirname = expand("%:h")

	" Check whether this new file is in a git repo
	let s:gitdir = substitute(system("cd " . s:dirname . " && git rev-parse --show-toplevel "), '\n\+$', '', '')
	let s:is_git_project = v:shell_error == 0

	" Set the virtual environment if this is a git repo with a virtual
	" environment specified at the expected location
	if s:is_git_project

		" Where we expect to find the virtual environment marker file
		let s:venv_location = s:gitdir . "/.venv"

		" Check if the marker file exists
		if filereadable(s:venv_location)

			" Get the name of the virtual environment from the marker file
			let s:venv_name = substitute(readfile(s:venv_location)[0], ' ', '', '')

			" $VIRTUAL_ENV contains the full path to the virtual environment,
			" but we want just the name which is stored as the last part of the
			" path
			let s:current_venv = fnamemodify($VIRTUAL_ENV, ":t")

			if s:venv_name != s:current_venv
				echomsg "setting python virtual environment to '" . s:venv_name . "'"
				call virtualenv#activate(s:venv_name)
				silent call coc#rpc#restart()
			endif
		endif
	endif
endfunction

autocmd BufRead,BufEnter *.py call s:AutoVenv()

" Display images
autocmd BufRead *.png,*.jpg,*gif exec "term ++close imgcat ".expand("%")
