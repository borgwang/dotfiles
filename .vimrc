" ------------------------------
" Plugins (with vim-plug)
" ------------------------------
call plug#begin('~/.vim/plugged')
" Tree
Plug 'preservim/nerdtree'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'
" Theme
Plug 'morhetz/gruvbox'
call plug#end()


" ------------------------------
" General Settings
" ------------------------------

" --- Indent --- "
set autoindent
set smartindent
set expandtab

" for common filetypes
set tabstop=4
set shiftwidth=4
set softtabstop=0  " do not mix space with tab

" for particular filetypes
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead *.html set filetype=html
autocmd BufNewFile,BufFilePre,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufFilePre,BufRead *.cc,*.h set filetype=cpp
autocmd BufNewFile,BufFilePre,BufRead *.json set filetype=json
autocmd FileType html,markdown,cpp,json,javascript setlocal ts=2 sw=2 sts=0

" --- Searching --- "
set showmatch
set incsearch
set hlsearch

set ignorecase  " ignore case when search by default
set smartcase  " use case if any caps used

" --- Appearance --- "
syntax enable
set background=dark
colorscheme gruvbox

set colorcolumn=81
highlight ColorColumn ctermbg=darkgray

set list
set listchars=tab:>-,trail:-  " show tab as '--->', trailing space as '-'

set splitbelow splitright  " natural ways to split vim windows
autocmd VimResized * wincmd =  " resize panes when window is resized

" --- Editing --- "
set encoding=utf-8  " utf-8 by default
set backspace=indent,eol,start  " backspace removes all
set scrolloff=10  " 10 lines before/after cursor during scroll

" save buffer whenever text is changed (see https://vi.stackexchange.com/questions/27098/autosave-and-nerdtree-conflicts)
autocmd TextChanged,TextChangedI *
  \ if &buftype ==# '' || &buftype == 'acwrite' |
  \     silent write |
  \ endif

" --- Misc --- "
set nocompatible
set ttyfast  " faster redrawing


" ------------------------------
" Key Mapping
" ------------------------------
" Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable number increasing and decreasing
map <C-a> <Nop>
map <C-x> <Nop>
map <C-b> <C-O>

" simple one-line snippets
iabbrev pdb import pdb; pdb.set_trace()


" ------------------------------
" Custom Commands
" ------------------------------
" remove tailing whitespaces
command Tailor :%s/\s\+$//e
" toggle paste mode
command PasteToggle :set paste!
" toggle line number showing
command NumberToggle :set number!
" locate current file in the tree
command Tree :NERDTreeFind
" open Finder.app with the current folder (Mac only)
command Finder :exe '!open '.expand("%:p:h")

" show current match position
if v:version > 801
  set shortmess-=S
endif

" ------------------------------
" Plugin Settings
" ------------------------------
" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" nerdtree key mapping
map <C-n> :NERDTreeToggle<CR>
