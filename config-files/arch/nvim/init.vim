call plug#begin()
Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf.vim'
Plug 'vim-utils/vim-man'
call plug#end()

set number
set relativenumber
set rnu
set termguicolors
syntax on
set linespace=4
let mapleader= " "
colorscheme OceanicNext
"shortcuts
inoremap kj <esc>
nmap <F8> :Autoformat <cr> :w <cr>
imap <F8> <esc> :Autoformat <cr> :w <cr>
nmap <c-s> :w<cr>
imap <c-s> <esc>:wall<cr>
imap <c-j> <esc>
vmap <c-j> <esc>
nmap <c-j> <esc>
nmap <c-q> :q<cr>
imap <c-w> <esc> <c-w>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>fs :w <CR>
map <leader>fq :wq <CR>
map <leader>sr :source% <CR>
map <leader>w <esc>ve
map <leader>l <esc>VyPj
map <leader>r <esc>:source ~/.config/nvim/init.vim <CR>
