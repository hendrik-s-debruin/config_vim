function! s:isPasswordFile()
	let filename = expand('%')
	let test1 = (match(filename, '/dev/shm/pass.*txt') == 0)
	let test2 = (match(filename, '$TMPDIR/pass.*txt')  == 0)
	let test3 = (match(filename, '/tmp/pass.*txt')     == 0)
	if test1 || test2 || test3
		return 1
	else
		return 0
	endif
endfunction

if s:isPasswordFile()
	set nobackup
	set nowritebackup
	set noswapfile
	set viminfo=
	set noundofile
	echomsg "Editing password file - disabling all plugins"
else
	set encoding=utf-8
	set nocompatible
	packadd! termdebug
	packadd! matchit
	source ~/.vim/appearance.vim
	source ~/.vim/behaviour.vim
	source ~/.vim/filetype.vim
	source ~/.vim/functions.vim
	source ~/.vim/bindings.vim
	source ~/.vim/packages.vim

	highlight SpellBad guifg=#cc241d cterm=underline,italic
endif

" ==============================================================================
" Bookmarks
" ==============================================================================
" ==================================== CoC =====================================
" ~/.vim/coc-settings.json

" ================================== Snippets ==================================
" ~/.vim/UltiSnips/cmake.snippets
" ~/.vim/UltiSnips/conan.snippets
" ~/.vim/UltiSnips/cpp_algorithm_mnemonics.snippets
" ~/.vim/UltiSnips/cpp_containers.snippets
" ~/.vim/UltiSnips/cpp_memory.snippets
" ~/.vim/UltiSnips/cpp.snippets
" ~/.vim/UltiSnips/c.snippets
" ~/.vim/UltiSnips/gitcommit.snippets
" ~/.vim/UltiSnips/rust.snippets
" ~/.vim/UltiSnips/snippets.snippets
" ~/.vim/UltiSnips/tex.snippets
" ~/.vim/UltiSnips/xml.snippets

" ============================ Syntax Highlighting =============================
" ~/.vim/after/syntax/c.vim
" ~/.vim/after/syntax/markdown.vim

" =========================== Settings for Filetypes ===========================
" ~/.vim/after/ftplugin/matlab.vim
" ~/.vim/after/ftplugin/c.vim
" ~/.vim/after/ftplugin/fugitiveblame.vim
" ~/.vim/after/ftplugin/gitcommit.vim
" ~/.vim/after/ftplugin/markdown.vim
" ~/.vim/after/ftplugin/python.vim
" ~/.vim/after/ftplugin/tex.vim
" ~/.vim/after/ftplugin/i3.vim
" ~/.vim/after/ftplugin/bash.vim
" ~/.vim/after/ftplugin/zsh.vim
" ~/.vim/after/ftplugin/man.vim
