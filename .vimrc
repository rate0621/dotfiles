let g:hybrid_use_iTerm_colors = 1
"colorscheme Hybrid
syntax on
nnoremap <F3> :noh<CR>

"set number
set ruler
set incsearch
set hlsearch
"set nowrap
set showmatch
"set whichwrap=h,l
set wrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set tabstop=4
set shiftwidth=4
" neovimではpastetoggleが不要（自動検出される）
if !has('nvim')
  set pastetoggle=<F2>
endif
set expandtab

set mouse=

" カラースキーム
set background=dark
colorscheme gruvbox
