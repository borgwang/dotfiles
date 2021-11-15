" ------------------------------
" Plugins (with vim-plug)
" ------------------------------
call plug#begin('~/.vim/plugged')
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'
" Theme
Plug 'morhetz/gruvbox'
" Z jump around
Plug 'lingceng/z.vim'
" goyo
Plug 'junegunn/goyo.vim'
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

"colorscheme gruvbox
colorscheme gruvbox

set colorcolumn=101
highlight ColorColumn ctermbg=darkgray

set list
set listchars=tab:>-,trail:-  " show tab as '--->', trailing space as '-'

set splitbelow splitright  " natural ways to split vim windows
autocmd VimResized * wincmd =  " resize panes when window is resized

" --- Editing --- "
set encoding=utf-8  " utf-8 by default
set backspace=indent,eol,start  " backspace removes all
set scrolloff=10  " 10 lines before/after cursor during scroll

" save buffer whenever text is changed
" Also avoid nerdtree conflicts (see https://vi.stackexchange.com/questions/27098/autosave-and-nerdtree-conflicts)
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
" Remap the Leader key
let mapleader=" "

" Switch to last-active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nnoremap <Leader><Space> :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Navigate between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt

" Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable number increasing and decreasing
map <C-a> <Nop>
map <C-x> <Nop>
map <C-b> <C-O>

" copy selection to system clickboard in visual mode (leader + c)
vnoremap <Leader>c "+y

" simple one-line python snippet
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
" open current folder with Finder.app (Mac only)
command Finder :exe '!open '.shellescape(expand("%:p:h"))
" open current file with Typora.app (Mac only)
command Typora :exe '!open -a Typora '.shellescape(expand("%:p"))

" rename the current file
function! Rename(name, bang)
    let l:curfile = expand("%:p")
    let l:curfilepath = expand("%:p:h")
    let l:newname = l:curfilepath . "/" . a:name
    let choice = confirm("Rename to " . l:newname . "?", "&Yes\n&No", 1)
    if choice == 1
        let v:errmsg = ""
        silent! exe "saveas" . a:bang . " " . l:newname
        if v:errmsg =~# '^$\|^E329'
            if expand("%:p") !=# l:curfile && filewritable(expand("%:p"))
                silent exe "bwipe! " . l:curfile
                if delete(l:curfile)
                    echoerr "Could not delete " . l:curfile
                endif
            endif
        else
            echoerr v:errmsg
        endif
    endif
endfunction
command! -nargs=* -complete=file -bang Rename :call Rename("<args>", "<bang>")

" delete current file
function! Delete()
    let choice = confirm("Delete current file and close buffer?", "&Yes\n&No", 1)
    if choice == 1
        call delete(expand("%:p")) | q!
    endif
endfunction
command! Delete :call Delete()

" ------------------------------
" Plugin Settings
" ------------------------------
" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2
" junegunn/goyo.vim
let g:goyo_height = 90
let g:goyo_width = 120

" enable goyo when opening markdown file
autocmd vimenter *.md
  \ if !&diff |
  \     Goyo |
  \ endif

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
