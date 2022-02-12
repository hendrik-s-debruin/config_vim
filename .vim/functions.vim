" This file keeps all custom functions and commands for vim

" ==============================================================================
" Reload configuration
" ==============================================================================
command! Rebash source ~/.vimrc

" ==============================================================================
" Hide/Show Line Numbers
" ==============================================================================
function! Nu()
	windo set number relativenumber
	augroup numbertoggle
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
	augroup END
endfunction
command! Nu call Nu()

function Nonu()
	windo set nonumber norelativenumber
	augroup numbertoggle
endfunction
command! Nonu call Nonu()

call Nu()

" ==============================================================================
" Close all other windows
" ==============================================================================
command! Only only | tabonly

" ==============================================================================
" Conceal Level
" ==============================================================================
function! ToggleConcealLevel()
	if &conceallevel == 0
		setlocal conceallevel=2
	else
		setlocal conceallevel=0
	endif
endfunction

" ==============================================================================
" RangerChooser
" ==============================================================================
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()

" ==============================================================================
" Sectioning
" ==============================================================================
function! SecMajor(border_char)
	let l:line = substitute(getline('.'), "^[ 	]*", "", "")
	let l:max_cols = &textwidth

	" length of the comment chars
	" -2 because commentstring contains '%s' literal
	let l:comment_len = len(&commentstring) - 2

	" Check the &commentstring pattern to see if comments only start a line, or
	" whether they also end the line
	if &commentstring =~ '%s$'
		let l:comment_has_trailing_chars = 0
	else
		let l:comment_has_trailing_chars = 1
	endif

	let l:current_line_number = getcurpos()[1]
	let l:current_indentation_in_spaces = indent(l:current_line_number)

	if &expandtab " if tabbing with spaces
		let l:tab_chars = repeat(" ", l:current_indentation_in_spaces)
	else " else if tabbing with tab chars
		let l:tab_chars = repeat("\t", l:current_indentation_in_spaces/&shiftwidth)
	endif


	if l:comment_has_trailing_chars
		let l:border = " " . repeat(a:border_char, l:max_cols - l:comment_len - 2 - l:current_indentation_in_spaces) . " "
		let l:space_len = l:max_cols - l:comment_len - len(l:line) - 1 - l:current_indentation_in_spaces
		let l:output_line =  " " . l:line . repeat(" ", l:space_len)
	else
		let l:border = " " . repeat(a:border_char, l:max_cols - l:comment_len -1 - l:current_indentation_in_spaces)
		let l:output_line = " " . l:line
	endif

	" For filetypes such as LaTeX, the comment sequence may contain a '%'
	" symbol. The following lines escape that symbol
	let l:comment_template = substitute(&commentstring, "%s", "COMMENT_TEMPLATE", "")
	let l:comment_template = substitute(l:comment_template, "%", "%%", "")
	let l:comment_template = substitute(l:comment_template, "COMMENT_TEMPLATE", "%s", "")

	let l:output = printf(l:comment_template, l:border)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	let l:output = printf(l:comment_template, l:output_line)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	let l:output = printf(l:comment_template, l:border)
	let l:failed = append(line('.'), l:tab_chars . l:output)

	execute ':normal! dd'
endfunction

function! SecMinor(border_char)
	let l:line = substitute(getline('.'), "^[ 	]*", "", "")
	let l:max_cols = &textwidth

	" length of the comment chars
	" -2 because commentstring contains '%s' literal
	let l:comment_len = len(&commentstring) - 2

	let l:current_line_number = getcurpos()[1]
	let l:current_indentation_in_spaces = indent(l:current_line_number)

	if &expandtab " if tabbing with spaces
		let l:tab_chars = repeat(" ", l:current_indentation_in_spaces)
	else " else if tabbing with tab chars
		let l:tab_chars = repeat("\t", l:current_indentation_in_spaces/&shiftwidth)
	endif

	" Check the &commentstring pattern to see if comments only start a line, or
	" whether they also end the line
	if &commentstring =~ '%s$'
		let l:comment_has_trailing_chars = 0
	else
		let l:comment_has_trailing_chars = 1
	endif

	if l:comment_has_trailing_chars
		let l:border_flank_double = (l:max_cols - len(l:line) - l:comment_len  - 4 - l:current_indentation_in_spaces)
		if l:border_flank_double % 2
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left + 1
		else
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left
		endif

		let l:output_line = " " . repeat(a:border_char, l:border_flank_left) . " " . l:line . " " . repeat(a:border_char, l:border_flank_right) . " "
	else
		let l:border_flank_double = (l:max_cols - len(l:line) - l:comment_len  - 3 - l:current_indentation_in_spaces)
		if l:border_flank_double % 2
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left + 1
		else
			let l:border_flank_left = l:border_flank_double / 2
			let l:border_flank_right = l:border_flank_left
		endif
		let l:output_line = " " . repeat(a:border_char, l:border_flank_left) . " " . l:line . " " . repeat(a:border_char, l:border_flank_right)
	endif

	" For filetypes such as LaTeX, the comment sequence may contain a '%'
	" symbol. The following lines escape that symbol
	let l:comment_template = substitute(&commentstring, "%s", "COMMENT_TEMPLATE", "")
	let l:comment_template = substitute(l:comment_template, "%", "%%", "")
	let l:comment_template = substitute(l:comment_template, "COMMENT_TEMPLATE", "%s", "")

	let l:output = l:tab_chars . printf(l:comment_template, l:output_line)
	let l:failed = append(line('.'), l:output)

	execute ':normal! dd'
endfunction

" ==============================================================================
" Write to a file that requires root permissions
" ==============================================================================
function! Sudow()
	:w !sudo tee % > /dev/null
endfunction
command! Sudow call Sudow()

" ==============================================================================
" Toggle Spellcheck
" ==============================================================================
function! ToggleSpell()
	if &spell
		set nospell
	else
		set spell
	endif
endfunction

" ==============================================================================
" Soft wrap at specific line
" ==============================================================================
let g:should_wrap_at = 0
function! WrapAt()
	if g:should_wrap_at == 0
		echo "Setting wrap"
		let g:should_wrap_at = 1
		augroup wrap_at
			autocmd!
			autocmd VimResized * set columns=80
		augroup END
		set columns=80
		set wrap
		noremap k gk
		noremap j gj
	else
		echo "Unsetting wrap"
		let l:width = getwininfo()
		augroup wrap_at
			autocmd!
		augroup END
		autocmd! wrap_at
		let g:should_wrap_at = 0
		set nowrap
	endif
endfunction

" ==============================================================================
" Get Syntax Group
" ==============================================================================
" from:
" https://stackoverflow.com/questions/9464844/how-to-get-group-name-of-highlighting-under-cursor-in-vim
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" ==============================================================================
" Open bookmark
" ==============================================================================
let s:ranger_bookmarks_file = $HOME . "/.config/ranger/bookmarks"
let s:zsh_bookmarks_file = $HOME . "/.config/zsh/bookmarks"
function OpenShellBookmark(bookmark)

	let s:bookmark_dictionary = {}

	let s:ranger_bookmarks = readfile(s:ranger_bookmarks_file)
	for bookmark in s:ranger_bookmarks
		let s:parts = split(bookmark, ":")
		let s:name = s:parts[0]
		let s:location = join(s:parts[1:], ":")
		let s:bookmark_dictionary[s:name] = s:location
		" echo "ranger bookmark: " . s:name . " location: " . s:location
	endfor

	let s:zsh_bookmarks = readfile(s:zsh_bookmarks_file)
	for bookmark in s:zsh_bookmarks
		" TODO don't copy-paste this from above
		let s:parts = split(bookmark, ":")
		let s:name = s:parts[0]
		let s:location = join(s:parts[1:], ":")
		let s:bookmark_dictionary[s:name] = s:location
	endfor

	if has_key(s:bookmark_dictionary, a:bookmark)
		let s:filename = s:bookmark_dictionary[a:bookmark]
		execute "e " . fnameescape(s:filename)
	else
		echo "unknown bookmark " . a:bookmark
	endif
endfunction

function s:ListShellBookmarks(ArgLead, CmdLine, CursorPos)
	let s:ranger_bookmarks = readfile(s:ranger_bookmarks_file)
	let s:zsh_bookmarks = readfile(s:zsh_bookmarks_file)

	let s:bookmarks = []

	echo "arglead: " . a:ArgLead

	for bookmark in s:ranger_bookmarks
		let s:bookmark_name = split(bookmark, ":")[0]
		if stridx(s:bookmark_name, a:ArgLead) == 0
			let s:bookmarks += [s:bookmark_name]
		endif
	endfor

	" TODO do not copy-paste this like above
	for bookmark in s:zsh_bookmarks
		let s:bookmark_name = split(bookmark, ":")[0]
		if stridx(s:bookmark_name, a:ArgLead) == 0
			let s:bookmarks += [s:bookmark_name]
		endif
	endfor

	return sort(s:bookmarks)
endfunction

command! -nargs=1 -complete=customlist,s:ListShellBookmarks C call OpenShellBookmark("<args>")
