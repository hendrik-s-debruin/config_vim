" This file associates file extensions with their respective languages
" CPP
function s:SetupCPP()
	setlocal filetype=cpp
	setlocal syntax=cpp.doxygen
	hi link doxygenParam                GruvboxAqua
	hi link doxygenSpecial              GruvboxAqua
	hi link doxygenSmallSpecial         GruvboxAqua
	hi link doxygenParamName            GruvboxBlue
	hi link doxygenBriefL               GruvboxFg3
	hi link doxygenSpecialMultilineDesc GruvboxFg0
	hi link doxygenStartL               GruvboxBg4
	" Modified from question
	" https://stackoverflow.com/questions/1280514/how-to-fold-c-style-comments-in-vim
	" answer https://stackoverflow.com/a/1284562
	"
	" TODO it's not clear if all of these are required, or just ome
	" syn match comment                     "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenParam                "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenSpecial              "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenSmallSpecial         "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenParamName            "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenBriefL               "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenSpecialMultilineDesc "\v(^\s*///.*\n)+" transparent fold
	" syn match doxygenStartL               "\v(^\s*///.*\n)+" transparent fold
endfunction
autocmd BufRead,BufNewFile *.tpp,*.hpp,*.cpp call s:SetupCPP()

" Rust
autocmd BufRead,BufNewFile *.rs :silent! call matchadd('Todo', 'todo!', -1)

" GLSL
autocmd BufRead,BufNewFile *.vs   setlocal filetype=glsl
autocmd BufRead,BufNewFile *.fs   setlocal filetype=glsl
autocmd BufRead,BufNewFile *.vert setlocal filetype=glsl
autocmd BufRead,BufNewFile *.tesc setlocal filetype=glsl
autocmd BufRead,BufNewFile *.tese setlocal filetype=glsl
autocmd BufRead,BufNewFile *.geom setlocal filetype=glsl
autocmd BufRead,BufNewFile *.frag setlocal filetype=glsl
autocmd BufRead,BufNewFile *.comp setlocal filetype=glsl

" ROS launch files
autocmd BufRead,BufNewFile *.launch setlocal filetype=xml

" Clang tools
autocmd BufRead,BufNewFile .clang-format setlocal filetype=yaml
autocmd BufRead,BufNewFile .clang-tidy   setlocal filetype=yaml

" GDB
autocmd BufRead,BufNewFile *.gdb setlocal filetype=gdb

" Gazebo
autocmd BufRead,BufNewFile *.world      setlocal filetype=xml
autocmd BufRead,BufNewFile *.sdf        setlocal filetype=xml
autocmd BufRead,BufNewFile model.config setlocal filetype=xml

" Conan (this is defining a new type not known to vim)
autocmd BufRead,BufNewFile conanfile.txt setlocal filetype=conan

" default version of tex when opening a .tex file
let g:tex_flavor="latex"

" Wasm: do not use lisp indentation rules
autocmd BufRead,BufNewFile *wat,*wast setlocal indentexpr=""

" Wiki
autocmd BufRead,BufNewFile *.wiki setlocal filetype=vimwiki

" rofi
autocmd BufRead,BufNewFile *.rasi setlocal filetype=css

" Python
autocmd BufRead,BufNewFile *.py setlocal foldmethod=marker

" Git commit
autocmd FileType gitcommit setlocal foldmethod=syntax
autocmd FileType git setlocal foldmethod=syntax
