call plug#begin()

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'morhetz/gruvbox'

call plug#end()

set nocompatible
set nu
set rnu
set noshowmode
set clipboard=unnamed
set undofile
set undodir=~/.config/nvim/undodir
set ruler
set cursorline
hi CursorLine cterm=BOLD ctermbg=16 ctermfg=NONE
set colorcolumn=80
highlight ColorColumn ctermbg=16 guibg=lightgrey
set updatetime=800
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
let mapleader = ' '

let g:gruvbox_italic=1
colorscheme gruvbox

if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
end

let g:coc_global_extensions = ['coc-prettier', 'coc-json', 'coc-explorer', 'coc-tsserver', 'coc-solargraph']

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ }

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackspace() ? "\<TAB>" :
  \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition>
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <c-space> coc#refresh()

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 1)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

set hlsearch
set incsearch
set ignorecase

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set splitright

nmap <Leader>e <Cmd>CocCommand explorer<CR>

nnoremap <leader>n :noh<CR>
nnoremap <leader>rn :set rnu!<CR>
nnoremap <leader>sp :set spell!<CR>

nnoremap <leader>fzf :FZF<CR>
nnoremap <leader>ff :Rg<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>, f,a<CR><ESC>
nnoremap <leader>w :w<CR>

