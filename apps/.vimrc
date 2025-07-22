" General Settings
set number
syntax on
set expandtab
set autoindent
set mouse=a
set splitbelow splitright
set cursorline
set clipboard=unnamedplus
set noshowmode
set encoding=utf-8
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Plugin Section
call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'girishji/vimcomplete'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tmhedberg/SimpylFold'
  Plug 'vim-scripts/indentpython.vim'
  Plug 'dracula/vim', { 'name': 'dracula' }
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'sheerun/vim-polyglot'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-fugitive'
  Plug 'davidhalter/jedi-vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'junegunn/vim-github-dashboard'
  Plug 'junegunn/vim-easy-align'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
call plug#end()

" Colors & UI
colorscheme dracula
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dracula'
let g:coc_global_extensions = ['coc-pyright']
let g:ale_linters = {
\   'python': ['flake8'],
\}
let g:ale_fixers = {
\   'python': ['black'],
\}
let g:ale_fix_on_save = 1
let g:jedi#force_py_version = 3
let g:jedi#goto_command = "<leader>d"
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_enabled = 1
let g:jedi#show_call_signatures = "1"
let $XDG_CACHE_HOME = expand("~/.cache")

" Filetype Settings
augroup FileTypeSettings
  autocmd!
  autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix
  autocmd FileType javascript,html,css setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END
" NERDTree
:autocmd VimEnter * NERDTree
autocmd BufEnter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR>

