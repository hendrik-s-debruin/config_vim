let NERDTreeMinimalUI=1
noremap <leader>nt :NERDTreeToggleVCS<Enter>
noremap <leader>ntf :NERDTreeFind<Enter>

let NERDTreeIgnore = ['build[[dir]]', 'cmake-build*', '\.git', '\.cache', '\.tags', 'target', '.*egg-info$', '__pycache__']
