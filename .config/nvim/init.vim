set showmatch               " show matching
set nohlsearch
set ignorecase              " case insensitive
set mouse=v                 " middle-click paste w
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=150                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
"set cursorline              " highlight current cursorline
set regexpengine=1
set exrc
set lazyredraw
set smartindent
set expandtab
"set guicursor
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
set guifont=SF\ Mono\ Powerline:h13
set shortmess=a
set cmdheight=2

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set expandtab
au BufRead,BufNewFile *.h set expandtab
au BufRead,BufNewFile Makefile* set noexpandtab

" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=140       " break lines when line length increases
set tabstop=4           " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a new line

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line



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
"Plug 'jprise/vim-graphql'

"nvim-telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rbgrouleff/bclose.vim'

"gruvbox theme

"github copilot
Plug 'github/copilot.vim'

"ranger, might remove?
"Plug 'francoiscabrol/ranger.vim'

"prettier for vim
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"automatic bracket pairs
Plug 'jiangmiao/auto-pairs'

"fugitive
Plug 'tpope/vim-fugitive'

"coc plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'

"deoplete nvim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

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
let g:prettier#autoformat = 1
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
let g:go_def_mapping_enabled = 0
let g:deoplete#enable_at_startup = 0

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

let g:coc_global_extensions = ['coc-solargraph']

let mapleader=" "


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" nerd tree
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

"switch tabs
nnoremap E :bnext<CR>
nnoremap Q :bprev<CR>

" terminal mode
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

" use jk to escape instead of esc
inoremap jk <ESC>


" highlight extra white space [ KEEP DISABLED - LOOKS UGLY ]
" highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" format cpp codes using clang
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

" Orgmode vim

lua << EOF

-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/Dropbox/org/*', '~/my-orgs/**/*'},
  org_default_notes_file = '~/Dropbox/org/refile.org',
})
EOF
