" -----------
" Vim-plug
" -----------

call plug#begin('~/.vim/plugged')

" Editing
Plug 'tpope/vim-commentary'
Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'
Plug 'SirVer/ultisnips'
Plug 'tmhedberg/SimpylFold'

" Markdown 
Plug 'iamcco/markdown-preview.vim'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'

" Theme
Plug 'morhetz/gruvbox'
Plug 'easysid/mod8.vim'

" code completion
Plug 'zxqfl/tabnine-vim'

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

set foldlevel=4
set incsearch 
set hlsearch

set bg=dark
set colorcolumn=80


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
colorscheme gruvbox
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

" SirVer/ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippet']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1
