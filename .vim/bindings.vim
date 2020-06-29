" This file sets all the editor bindings

let mapleader = ';'

" Native
nnoremap <leader>z :!newsh<CR><CR>
noremap <leader>tml :tabmove +1<Enter>
noremap <leader>tmr :tabmove -1<Enter>
noremap <leader>vs :vsplit<Enter>
noremap <leader>s :split<Enter>
noremap <leader>t :tabnew<Enter>
noremap <leader>hc :nohlsearch<Enter>

" Locally defined functions
noremap <leader>r :RangerChooser<Enter>
noremap <leader>i :call IncludeCHeader()<Enter>
noremap <leader>I :call IncludeCSystemHeader()<Enter>
noremap <leader>s1 :call SecMajor("=")<Enter>
noremap <leader>s2 :call SecMajor("-")<Enter>
noremap <leader>s3 :call SecMinor("=")<Enter>
noremap <leader>s4 :call SecMinor("-")<Enter>
