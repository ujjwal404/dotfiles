set showmatch               " show matching
set hlsearch
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=100                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set regexpengine=1
set exrc
set lazyredraw
set t_Co=256
set smartindent
set expandtab
set guicursor
set nu
set hidden
set noerrorbells
set splitright
set splitbelow
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undodir
set incsearch
set termguicolors
set scrolloff=8
set ttyfast                " Speed up scrolling in Vim
set signcolumn=yes
set redrawtime=10000
set re=0
set guifont=BitstreamVeraSansMono_NF:h13
set shortmess=a
set cmdheight=2

call plug#begin('~/.local/share/nvim/plugged')

"NerdTree sidebar
Plug 'scrooloose/nerdtree'

"Go LSP
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Comments plugin
Plug 'tpope/vim-commentary'

"Octave
Plug 'tranvansang/octave.vim'

"Scala plugins
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}


"iPlug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"GraphQL plugins
" Plug 'jprise/vim-graphql'

"nvim-telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rbgrouleff/bclose.vim'

"gruvbox theme


"ranger, might remove?
Plug 'francoiscabrol/ranger.vim'

"prettier for vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"automatic bracket pairs
Plug 'jiangmiao/auto-pairs'

"fugitive
Plug 'tpope/vim-fugitive'

"coc plugin
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'severin-lemaignan/vim-minimap'

"change surrounding brackets, quotes
Plug 'tpope/vim-surround'

"airline
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'


"fzf plugin
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'nanotech/jellybeans.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'ryanoasis/vim-devicons'

call plug#end()


source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim


if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme onedark


highlight Normal guibg=NONE ctermbg=NONE

let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:prettier#autoformat = 0
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
let g:go_def_mapping_enabled = 0


au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

let g:coc_global_extensions = ['coc-solargraph']

let mapleader=" "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>e :bnext<CR>
nnoremap <leader>q :bprev<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>
nnoremap <c-n> :call OpenTerminal()<CR>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
map <F5> :wall!<CR>:!sbcl --load foo.cl<CR><CR>

" use jk to escape instead of esc
inoremap jk <ESC> 



highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

function! s:JbzClangFormat(first, last)
  let l:winview = winsaveview()
  execute a:first . "," . a:last . "!clang-format"
  call winrestview(l:winview)
endfunction
command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)

" Autoformatting with clang-format
au FileType c,cpp nnoremap <buffer><leader>lf :<C-u>JbzClangFormat<CR>
au FileType c,cpp vnoremap <buffer><leader>f :JbzClangFormat<CR>

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>a