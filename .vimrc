" ------------------------------
" Plugins
" ------------------------------
call plug#begin('~/.vim/plugged')
" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'
" goyo
Plug 'junegunn/goyo.vim'
" Theme
Plug 'morhetz/gruvbox'
" dirdiff
Plug 'will133/vim-dirdiff'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()


" ------------------------------
" General Settings
" ------------------------------
" --- Statusline --- "

" --- Indent --- "
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2  " do not mix space with tab

" for particular filetypes
autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufFilePre,BufRead *.html set filetype=html
autocmd BufNewFile,BufFilePre,BufRead *.js set filetype=javascript
autocmd BufNewFile,BufFilePre,BufRead *.cc,*.h,*.cpp set filetype=cpp
autocmd BufNewFile,BufFilePre,BufRead *.json set filetype=json
autocmd BufNewFile,BufFilePre,BufRead *.python set filetype=python
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
set laststatus=2
set statusline+=%F

" colorscheme gruvbox
colorscheme gruvbox

set colorcolumn=101
highlight ColorColumn ctermbg=lightgray

set list
set listchars=tab:>-,trail:-  " show tab as '--->', trailing space as '-'

set splitbelow splitright  " natural ways to split vim windows
autocmd VimResized * wincmd =  " resize panes when window is resized

" --- Editing --- "
set nocompatible
set encoding=utf-8  " utf-8 by default
set backspace=indent,eol,start  " backspace removes all
set scrolloff=10  " 10 lines before/after cursor during scroll
" save buffer whenever text is changed
" Also avoid nerdtree conflicts (see https://vi.stackexchange.com/questions/27098/autosave-and-nerdtree-conflicts)
autocmd TextChanged,TextChangedI *
  \ if &buftype ==# '' || &buftype == 'acwrite' |
  \     silent write |
  \ endif

" --- Performance --- "
set lazyredraw
set ttyfast  " faster redrawing
set re=0  " use new regular expression engine

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

tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

" disable number increasing and decreasing
map <C-a> <Nop>
map <C-x> <Nop>
map <C-b> <C-O>

" map :tabp and :tabn
nnoremap <silent> th :tabp<CR>
nnoremap <silent> tl :tabn<CR>

" copy selection to system clickboard in visual mode (leader + c)
vnoremap <Leader>c "+y


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
command Finder :silent exec '!open '.shellescape(expand("%:p:h")) | redraw!
" open current file with Typora.app (Mac only)
command Typora :silent exec '!open -a Typora '.shellescape(expand("%:p")) | redraw!
# open terminal
command Terminal :terminal++rows=24

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

" -----------
" Custom Snippets
" -----------
" simple one-lineython snippet
iabbrev pdb import pdb; pdb.set_trace()


" ------------------------------
" Plugin Settings
" ------------------------------

" --- plasticboy/vim-markdown ---
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_new_list_item_indent = 2

" --- will133/vim-dirdiff ---
let g:DirDiffExcludes = ".git"

" --- junegunn/goyo.vim ---
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

" --- junegunn/fzf.vim ---
function! SetWorkingDirectory()
  while 1
    let l:directory = input("Please specify current working directory: ", "~/", "dir")
    if isdirectory(expand(l:directory))
      let g:fzf_current_working_directory = l:directory
      break
    endif
  endwhile
endfunction
command! SetWorkingDirectory :call SetWorkingDirectory()

function! Find(pattern)
  if !exists("g:fzf_current_working_directory")
    call SetWorkingDirectory()
  endif
  let l:pattern = a:pattern
  if l:pattern == ""
    let l:pattern = expand("<cword>")
  endif
  call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case "
    \.l:pattern." ".g:fzf_current_working_directory, 1, 0)
  " cache current pattern
  let g:fzf_previous_grep_pattern = l:pattern
endfunction
command! -nargs=* Find :call Find("<args>")

function! Files()
  if !exists("g:fzf_current_working_directory")
    call SetWorkingDirectory()
  endif
  echo g:fzf_current_working_directory
  call fzf#vim#files(g:fzf_current_working_directory, 0)
endfunction
nnoremap <C-p> :call Files()<Cr>

function! PreviousFind()
  if exists("g:fzf_previous_grep_pattern")
    call Find(g:fzf_previous_grep_pattern)
  endif
endfunction
nnoremap <C-f> :call PreviousFind()<Cr>

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
