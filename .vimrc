"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic coding style
set tabstop=2
set shiftwidth=2
set expandtab

set cindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search settings
set smartcase
set hlsearch
set incsearch
set ignorecase
set showmatch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor line
set startofline
set cursorline
"set cursorcolumn

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlightning
syntax enable
set t_Co=256

set nu     " No line number
set nocp   " No compatibility mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mouse=a

filetype plugin on


call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" Using git URL
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Colors
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

" Visualization
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
nmap <C-i> <leader>ig

Plug 'ap/vim-css-color'

" Interface
Plug 'bling/vim-airline'
"let g:airline_powerline_fonts = 1
set laststatus=2

Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
" npm install -g jsxhint
" npm install standard
let g:syntastic_javascript_checkers = ['jsxhint', 'standard']
"let g:syntastic_javascript_checkers = ['jsxhint']
"let g:syntastic_javascript_standard_exec = 'happiness'
let g:syntastic_javascript_standard_generic = 1

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <C-m> :NERDTreeToggle<CR>
Plug 'jistr/vim-nerdtree-tabs'
let g:nerdtree_tabs_open_on_console_startup = 1
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'fholgado/minibufexpl.vim'
let g:miniBufExplMapCTabSwitchBufs = 1

Plug 'bronson/vim-trailing-whitespace'

" Searching
Plug 'gabesoft/vim-ags'

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"Ruby Section
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'

Plug 'tpope/vim-bundler'

Plug 'tpope/vim-endwise'

Plug 'terryma/vim-multiple-cursors'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLORS!
"set background=dark
"colorscheme solarized
"colorscheme seoul256
"colorscheme darkblue
colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font (for windows)
"set gfn=Lucida_Console:h7:cANSI
