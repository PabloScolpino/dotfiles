filetype plugin on

" ================================================================================
" Plug config
call plug#begin('~/.vim/plugged')

" Productivity
Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'

" Interface
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
nmap <C-i> <leader>ig

Plug 'bling/vim-airline'
set laststatus=2

Plug 'bronson/vim-trailing-whitespace'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

" Plug 'Valloric/YouCompleteMe'
Plug 'shawncplus/phpcomplete.vim'
Plug 'qbbr/vim-symfony'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" Preview & visualization
Plug 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Safari'
Plug 'tyru/open-browser.vim'

" Syntax hightlight and code hints
Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']

" prerequisites for syntastic jsx
" npm install -g jsxhint
" npm install standard
let g:syntastic_javascript_checkers = ['jsxhint', 'standard']
let g:syntastic_javascript_standard_generic = 1

" Searching
Plug 'gabesoft/vim-ags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Search & Replace
Plug 'firegoby/html_entities_helper.vim'
" use it with
" <esc>\He

" GIT
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ruby Section
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'thoughtbot/vim-rspec'

" PHP
Plug 'stanangeloff/php.vim'
Plug 'lumiliet/vim-twig'

" CSS
Plug 'ap/vim-css-color'

" COFFEE SCRIPT
Plug 'kchmck/vim-coffee-script'
call plug#end()

nmap <Leader>pi :so %<CR>:PlugInstall<CR>:PlugClean!<CR>
nmap <Leader>pu :so %<CR>:PlugUpdate<CR>

" ================================================================================
" Basic coding style
set tabstop=2
set shiftwidth=2
set expandtab

au FileType php setl sw=4 sts=4 et

set cindent

" ================================================================================
" Search settings
set smartcase
set hlsearch
set incsearch
set ignorecase
set showmatch

" ================================================================================
" Cursor line
set startofline
set cursorline

" ================================================================================
" Syntax highlightning
syntax enable
set t_Co=256

set nu     " No line number
set nocp   " No compatibility mode

au BufNewFile,BufRead /tmp/sql* set filetype=sql

" ================================================================================
" COLORS!
colorscheme jellybeans

" ================================================================================
" Font (for windows)
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
"let g:airline_powerline_fonts = 1
"set guifont=Bitstream\ Vera\ Sans\ Mono:h12
"
" ================================================================================
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif
