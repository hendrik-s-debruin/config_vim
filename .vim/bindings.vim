" This file sets all the editor bindings

let mapleader = ';'

" Native
nnoremap <leader>z   :!newsh<CR><CR>
noremap  <leader>tml :tabmove +1<Enter>
noremap  <leader>tmr :tabmove -1<Enter>
noremap  <leader>vs  :vsplit<Enter>
noremap  <leader>s   :split<Enter>
noremap  <leader>t   :tabnew<Enter>
noremap  <leader>hc  :nohlsearch<Enter>
noremap  <leader>dgh :diffget LOCAL<Enter>
noremap  <leader>dgk :diffget BASE<Enter>
noremap  <leader>dgl :diffget REMOTE<Enter>
noremap  <leader>cn  :cnext<CR>
noremap  <leader>cp  :cprev<CR>

" Locally defined functions
noremap <leader>r  :RangerChooser<Enter>
noremap <leader>s1 :call SecMajor("=")<Enter>
noremap <leader>s2 :call SecMajor("-")<Enter>
noremap <leader>s3 :call SecMinor("=")<Enter>
noremap <leader>s4 :call SecMinor("-")<Enter>
noremap <leader>c  :call ToggleConcealLevel()<Enter>
noremap <leader>ss :call ToggleSpell()<Enter>
noremap <leader>we :call WrapAt()<CR>
noremap <leader>oo :only<CR>
noremap <leader>OO :Only<CR>
noremap <leader>sg :call SynGroup()<CR>

if &diff
	noremap Q :qall!<CR>
endif
