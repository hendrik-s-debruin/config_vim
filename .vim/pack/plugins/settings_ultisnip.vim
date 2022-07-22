" autocmd BufNewFile,BufRead .vimspector.json setlocal filetype=vimspector
autocmd BufNewFile,BufRead .vimspector.json UltiSnipsAddFiletypes vimspector.json

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
