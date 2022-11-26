" autocmd BufNewFile,BufRead .vimspector.json setlocal filetype=vimspector
autocmd BufNewFile,BufRead .vimspector.json UltiSnipsAddFiletypes vimspector.json
autocmd BufNewFile,BufRead docker-compose.yml UltiSnipsAddFiletypes docker-compose.yml

let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
