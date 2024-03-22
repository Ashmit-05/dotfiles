set number
set rnu
syntax enable
filetype indent on
set autoindent expandtab tabstop=2 shiftwidth=2
set encoding=utf-8

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" Nerd tree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTree<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
nnoremap <silent> <C-f> :Files<CR>

