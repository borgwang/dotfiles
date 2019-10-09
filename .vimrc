" -----------
" Vim-plug
" -----------

" Plugin List
call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'
Plug 'SirVer/ultisnips'

" Markdown 
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'

" Theme
Plug 'morhetz/gruvbox'
Plug 'easysid/mod8.vim'

call plug#end()


" -----------
" General Settings
" -----------
"
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


" -----------
" Key Mapping 
" -----------

" Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" <space> to <c-d>
nnoremap <space> <c-d>


" -----------
" Colorscheme
" colorscheme mod8
" -----------


" -----------
" Plugin Settings
" -----------

" 907th/vim-auto-save 
let g:auto_save=1

" plasticboy/vim-markdown 
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1

" jiangmiao/auto-pairs 
let g:AutoPairsShortcutFastWrap = '<c-w>'


let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippet']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
