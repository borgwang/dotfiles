" -----------
" Vim-plug
" -----------
call plug#begin('~/.vim/plugged')

" view
Plug 'preservim/nerdtree'
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'
" Theme
Plug 'morhetz/gruvbox'
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

" indent settings from particular filetypes
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead *.html set filetype=html
autocmd BufNewFile,BufFilePre,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufFilePre,BufRead *.cc,*.h set filetype=cpp
autocmd BufNewFile,BufFilePre,BufRead *.json set filetype=json

autocmd FileType html,markdown,cpp,json,javascript setlocal ts=2 sw=2 sts=0

set foldlevel=4
set incsearch
set hlsearch

set bg=dark
set colorcolumn=81
highlight ColorColumn ctermbg=lightgray

set ignorecase  " ignore case when search by default
set smartcase  " use case if any caps used

" natural ways to split vim windows
set splitbelow splitright

" show tab as --->
" show trailing space as -
set listchars=tab:>-,trail:-
set list

set nofixendofline

" save buffer whenever text is changed
" autocmd TextChanged,TextChangedI * silent write
" for nerdtree conflict, see https://vi.stackexchange.com/questions/27098/autosave-and-nerdtree-conflicts
autocmd TextChanged,TextChangedI *
  \ if &buftype ==# '' || &buftype == 'acwrite' |
  \     silent write |
  \ endif

" resize panes when window is resized
autocmd VimResized * wincmd =


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

" simple oneline snippets
iabbrev pdb import pdb; pdb.set_trace()

" -----------
" Custom Commands
" -----------
" command to remove tailing whitespaces
command Tailor :%s/\s\+$//e

" command to toggle paste mode
command PasteToggle :set paste!

" command to toggle line number showing
command NumberToggle :set number!

command Tree :NERDTreeFind

if v:version > 801
  " show current match position
  set shortmess-=S
endif

" -----------
" Plugin Settings
" -----------
" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" nerdtree key mapping
map <C-n> :NERDTreeToggle<CR>


