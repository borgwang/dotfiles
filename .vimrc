" Use vim-plug to manage plugins (https://github.com/junegunn/vim-plug)

" Plugin List
call plug#begin('~/.vim/plugged')

" Python
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug '907th/vim-auto-save'

" Markdown Preview
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'

call plug#end()

" General Settings
set nocompatible  
syntax enable  
set number  " show line number
set ttyfast  " terminal axxeleration
set enc=utf-8  " utf-8 by default
set backspace=indent,eol,start  " backspace removes all
set scrolloff=10  " 10 lines before/after cursor during scroll
set showmatch
set smartindent

set incsearch 
set hlsearch

" Key Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Global variable settings
let g:auto_save=1

