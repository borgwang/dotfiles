" -----------
" Vim-plug
" -----------
call plug#begin('~/.vim/plugged')

" view
Plug 'preservim/nerdtree'

" Editing
Plug '907th/vim-auto-save'
Plug 'preservim/nerdcommenter'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'

" Theme
Plug 'morhetz/gruvbox'

" Python
Plug 'fisadev/vim-isort'

call plug#end()


" -----------
" Colorscheme
" -----------
colorscheme gruvbox


" -----------
" General Settings
" -----------
set nocompatible
syntax enable

set number  " show line number
set ttyfast  " terminal axxeleration
set enc=utf-8  " utf-8 by default
set backspace=indent,eol,start  " backspace removes all
set scrolloff=10  " 10 lines before/after cursor during scroll
set showmatch

set autoindent
set smartindent

set expandtab
" indent settings for common filetypes
set tabstop=4
set shiftwidth=4
set softtabstop=0  " do not mix space with tab

" indent settings from perticular filetypes
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd FileType markdown setlocal ts=2 sw=2 sts=0

set path+=**

set foldlevel=4
set incsearch
set hlsearch

set bg=dark
set colorcolumn=100
highlight ColorColumn ctermbg=lightgray

set ignorecase  " ignore case when search by default
set smartcase  " use case if any caps used

" natural ways to split vim windows
set splitbelow splitright

" show tab as --->
" show trailing space as -
set listchars=tab:>-,trail:-
set list

" save buffer whenever text is changed
autocmd TextChanged,TextChangedI * silent write

" -----------
" Key Mapping
" -----------
" Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable number increasing and decreasing
map <C-a> <Nop>
map <C-x> <Nop>

map <C-b> <C-O>

" map :tabp and :tabn
nnoremap <silent> th :tabp<CR>
nnoremap <silent> tl :tabn<CR>

" simple snippets for python debugging
iabbrev pdb import pdb; pdb.set_trace()

" vimdiff highlighting
highlight DiffAdd    cterm=BOLD ctermfg=NONE ctermbg=22
highlight DiffDelete cterm=BOLD ctermfg=NONE ctermbg=52
highlight DiffChange cterm=BOLD ctermfg=NONE ctermbg=23
highlight DiffText   cterm=BOLD ctermfg=NONE ctermbg=2

" -----------
" Custom Commands
" -----------
" command to remove tailing whitespaces
command Tailor :%s/\s\+$//e

" command to toggle paste mode
command PasteToggle :set paste!

" command to toggle line number showing
command NumberToggle :set number!

" -----------
" Plugin Settings
" -----------

" 907th/vim-auto-save
let g:auto_save=1

" plasticboy/vim-markdown
let g:vim_markdown_math = 1

" tmhedberg/SimpylFold
let g:SimpylFold_docstring_preview = 1

" nerdtree key mapping
map <C-n> :NERDTreeToggle<CR>

" nerdcommenter
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" vim-isort
let g:vim_isort_map = '<C-i>'

