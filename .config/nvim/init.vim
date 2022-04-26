syntax on
filetype plugin on
set number
set relativenumber
set ruler

set expandtab
set smarttab
set shiftwidth=2
set tabstop=4

set hlsearch
set incsearch

set path+=**
set wildmenu
set clipboard=unnamedplus
set nowrap

let g:netrw_banner=0
let g:netrw_browsee_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_winsize = 25

" #########################################################################
let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set norelativenumber
        set nonumber
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set relativenumber
        set number
    endif
endfunction

function! StripImgURLS()
    set nowrap
    %!grep \<img
    %s/<img/\r<img/g
    %s/.*src="//g
    %s/".*//g
    %!grep ://
endfunction


function! StripURLS()
    set nowrap
    %!grep -oP '(http:|https:|//).+?"'
    %s/\v('|").*//g
    %s/\\\//\//g
endfunction

function! GetDomains()
    s/.*@//g
endfunction

" #########################################################################

inoremap jj <Esc>
nnoremap d "_d
vnoremap d "_d

" Move to next tab
noremap gn  gt
" Move to previous tab
noremap gm  gT

" Move to next buffer
noremap bn  :bnext<CR>
" Move to previous buffer
noremap bm  :bprevious<CR>
" Close current buffer
noremap bw  :bw<CR>

map ,f              	:Files<CR>
map ,l              	:Lex!<CR>
nnoremap <C-n> 		    :NERDTree<CR>
nnoremap <C-t> 		    :NERDTreeToggle<CR>
nnoremap <C-f> 		    :NERDTreeFind<CR>
map ,b              	:Buffers<CR>
map ,z              	:set wrap<CR>
map ,zj             	:set nowrap<CR>
map <silent> ,h     	:call ToggleHiddenAll()<CR>
map <silent> ,gd    	:call GetDomains()<CR>
map <silent> ,su    	:call StripURLS()<CR>
map <silent> ,siu   	:call StripImgURLS()<CR>
nnoremap <Up>       	:resize -2<CR>
nnoremap <Down>     	:resize +2<CR>
nnoremap <Left>     	:vertical resize -2<CR>
nnoremap <Right>    	:vertical resize +2<CR>
map ,rw             	:s/\s\+//g<CR>
map ,rl             	:norm .<CR>
map ,rnl            	:s/\n//g<CR>

" #########################################################################

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()
