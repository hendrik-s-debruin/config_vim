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

" Automatically activate a python virtual environment when editing the file if
" that environment is not yet active
function s:AutoVenv()
	" Get directory name of current file
	let s:dirname = expand("%:h")

	" Check whether this new file is in a git repo
	let s:gitdir = substitute(system("cd " . s:dirname . " && git rev-parse --show-toplevel "), '\n\+$', '', '')
	let s:is_git_project = v:shell_error == 0

	" Set the virtual environment if this is a git repo with a virtual
	" environment specified at the expected location
	if s:is_git_project
		let s:venv_location = s:gitdir . "/.venv"
		if filereadable(s:venv_location)
			let s:venv_name = substitute(readfile(s:venv_location)[0], ' ', '', '')

			" $VIRTUAL_ENV contains the full path to the virtual environment,
			" but we want just the name which is stored as the last part of the
			" path
			let s:current_venv = fnamemodify($VIRTUAL_ENV, ":t")

			if s:venv_name != s:current_venv
				echomsg "setting python virtual environment to '" s:venv_name "'"
				call virtualenv#activate(s:venv_name)
				silent call coc#rpc#restart()
			endif
		endif
	endif
endfunction

autocmd BufReadPost * call s:AutoVenv()
