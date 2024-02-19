set number
set rnu
syntax enable
filetype indent on
set autoindent expandtab tabstop=2 shiftwidth=2
set encoding=utf-8

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'faith/vim-go'
call plug#end()

" Nerd tree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

