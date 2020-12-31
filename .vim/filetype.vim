" This file associates file extensions with their respective languages
" CPP
autocmd BufRead,BufNewFile *.tpp  set filetype=cpp

" GLSL
autocmd BufRead,BufNewFile *.vs   set filetype=glsl
autocmd BufRead,BufNewFile *.fs   set filetype=glsl
autocmd BufRead,BufNewFile *.vert set filetype=glsl
autocmd BufRead,BufNewFile *.tesc set filetype=glsl
autocmd BufRead,BufNewFile *.tese set filetype=glsl
autocmd BufRead,BufNewFile *.geom set filetype=glsl
autocmd BufRead,BufNewFile *.frag set filetype=glsl
autocmd BufRead,BufNewFile *.comp set filetype=glsl

" ROS launch files
autocmd BufRead,BufNewFile *.launch set filetype=xml

" Clang tools
autocmd BufRead,BufNewFile .clang-format set filetype=yaml
autocmd BufRead,BufNewFile .clang-tidy   set filetype=yaml

" GDB
autocmd BufRead,BufNewFile *.gdb set filetype=gdb

" Gazebo
autocmd BufRead,BufNewFile *.world set filetype=xml

" Conan (this is defining a new type not known to vim)
autocmd BufRead,BufNewFile conanfile.txt  set filetype=conan

" default version of tex when opening a .tex file
let g:tex_flavor="latex"

" Wasm: do not use lisp indentation rules
autocmd BufRead,BufNewFile *wat,*wast set indentexpr=""
