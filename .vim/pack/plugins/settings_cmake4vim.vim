nnoremap <leader>sbt :FZFCMakeSelectBuildType<CR>
nnoremap <leader>st  :FZFCMakeSelectTarget<CR>
nnoremap <leader>bb  :CMakeBuild<CR>

let g:make_arguments="-j$(nproc)"
