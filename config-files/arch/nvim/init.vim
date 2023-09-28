set path+=**
set wildmode=longest,list,full
set wildmenu
set shell=/usr/bin/zsh
" Ignore files
set wildignore+=*_build/k
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
call plug#begin()

"themes
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/everforest'
Plug 'ntk148v/vim-horizon'
Plug 'sainnhe/edge'
Plug 'itchyny/lightline.vim'

"latex
Plug 'lervag/vimtex'

Plug 'mbbill/undotree'
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-rfc'
Plug 'sbdchd/neoformat'
Plug 'vuciv/vim-bujo'


"language-support
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
call plug#end()



set number
set encoding=UTF-8
set relativenumber
set rnu
set termguicolors
syntax on
let mapleader= " "

"from primagen
set exrc
set linespace=2
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
"set nohlsearch
set hidden
set noerrorbells

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch
set scrolloff=8

" Give more space for displaying messages
set cmdheight=2

" colorscheme (theme)
colorscheme horizon
let g:lightline = {}
let g:lightline.colorscheme = 'horizon'

" Respect transparency
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none

6
" hi NonText guibg=NONE ctermbg=NONE


"shortcuts
inoremap kj <esc>
vnoremap kj <esc>
nmap <c-s> :w<cr>
imap <c-s> <esc>:wall<cr>
imap <c-j> <esc>
vmap <c-j> <esc>
nmap <c-j> <esc>
nmap <c-q> :q<cr>
imap <c-w> <esc> <c-w>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <leader>sr :source% <CR>
map <leader>n :!./run.sh <CR>
map <leader>w <esc>ve
map <leader>l <esc>VyPj
map <leader>r <esc>:source ~/.config/nvim/init.vim <CR>
map <leader><leader><leader> <esc>ggVGd
vnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
nnoremap <leader>ee :e ~/.config/nvim/init.vim<CR>
nnoremap <C-l> ggVGd
nnoremap <leader>d "_d
vnoremap <leader>d "_d

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>kj

" vim TODO
nmap <leader>tu <Plug>BujoChecknormal
nmap <leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" NerdTree
nnoremap <C-b> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"

" CP shortcuts
nmap <F1> :<C-U>!g++ -std=c++17 -DLOCAL %:r.cpp -o %:r<CR>
nmap <F2> :<C-U>!kitty --hold $PWD/%:r <CR>
lua << EOF
