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
