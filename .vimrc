" -----------
" Vim-plug
" -----------
call plug#begin('~/.vim/plugged')

" view
Plug 'preservim/nerdtree'

" Editing
Plug 'Chiel92/vim-autoformat'
Plug '907th/vim-auto-save'
Plug 'tmhedberg/SimpylFold'
Plug 'preservim/nerdcommenter'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'plasticboy/vim-markdown'

" Theme
Plug 'morhetz/gruvbox'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
set tabstop=4
set shiftwidth=4
set softtabstop=0  " do not mix space with tab

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


" -----------
" Key Mapping
" -----------
" Windows Navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" yank to system clipboard
vmap Y :w !pbcopy<CR><CR>

" disable number increasing and decreasing
map <C-a> <Nop>
map <C-x> <Nop>

map <C-b> <C-O>

" map :tabp and :tabn
nnoremap <silent> th :tabp<CR>
nnoremap <silent> tl :tabn<CR>

" map space to :
noremap <space> :


" -----------
" Custom Commands
" -----------
" command to remove tailing whitespaces
command Tailor :%s/\s\+$//e

" command to toggle paste mode
command PasteToggle :set paste!

" -----------
" Plugin Settings
" -----------

" 907th/vim-auto-save
let g:auto_save=1

" plasticboy/vim-markdown
let g:vim_markdown_folding_disabled = 1
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


" -----------------------------------
" Coc
" -----------------------------------

let g:coc_global_extensions = [
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-json',
  \ 'coc-git'
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
