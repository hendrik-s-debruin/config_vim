" This file should run after all other settings and plugins. This is required
" since some settings will be overwritten by other 3rd party plugins.

" Highlighting for spelling errors
highlight SpellBad guifg=#cc241d cterm=underline,italic

" Make terminal transparent
hi Normal ctermbg=NONE guibg=NONE

" Coc Errors
hi CocErrorHighlight cterm=underline

" Coc cSpell errors
hi CocInfoHighlight cterm=underline
