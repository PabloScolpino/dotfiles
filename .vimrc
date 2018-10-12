filetype plugin on

"====[ Define a more agreeable <Leader> ]======================================
let mapleader = ","

"====[ Set up smarter search behaviour ]======================================
set incsearch       "Lookahead as search pattern is specified
set ignorecase      "Ignore case in all searches...
set smartcase       "...unless uppercase letters used

set hlsearch        "Highlight all matches
highlight clear Search
highlight       Search    ctermfg=White  ctermbg=Black  cterm=bold
highlight    IncSearch    ctermfg=White  ctermbg=Red    cterm=bold

" Absolute direction for n and N...
nnoremap  <silent><expr> n  'Nn'[v:searchforward] . ":call HLNext()\<CR>"
nnoremap  <silent><expr> N  'nN'[v:searchforward] . ":call HLNext()\<CR>"

"Delete in normal mode to switch off highlighting till next search and clear messages...
nmap <silent> <BS> [Cancel highlighting]  :call HLNextOff() <BAR> :nohlsearch <BAR> :call VG_Show_CursorColumn('off')<CR>::HierClear<CR>

"Double-delete to remove trailing whitespace...
nmap <silent> <BS><BS>  [Remove trailing whitespace] mz:call TrimTrailingWS()<CR>`z

function! TrimTrailingWS ()
  if search('\s\+$', 'cnw')
    :%s/\s\+$//g
  endif
endfunction


"==============================================================================
"====[ Plugins configuration ]================================================
call plug#begin('~/.vim/plugged')

"========[ List handing ]======================================
Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'

"========[ interface improvements ]============================
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

"========[ VIM Buffer handling ]============================
" Go to the vim instance that already has the file open + other stuff
Plug 'vitorgalvao/autoswap_mac'
set title titlestring=

" Highlight trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'

" Editing
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'


" Plug 'Valloric/YouCompleteMe'
" Plug 'shawncplus/phpcomplete.vim'
Plug 'qbbr/vim-symfony'

"========[ Code Snippets ]===================================
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.UltiSnips', $HOME.'/.vim/UltiSnips']
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"========[ Preview & visualization ]=========================
Plug 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Safari'
Plug 'tyru/open-browser.vim'

Plug 'FuDesign2008/mermaidViewer.vim'
autocmd BufNewFile,BufReadPost *.mmd,*.mermaid set filetype=mermaid

"========[ Syntax hightlight and code hints ]================
Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']

" prerequisites for syntastic jsx
" npm install -g jsxhint
" npm install standard
let g:syntastic_javascript_checkers = ['jsxhint', 'standard']
let g:syntastic_javascript_standard_generic = 1

"========[ Searching ]================
Plug 'gabesoft/vim-ags'
map ag Ags
map age AgsEditSearchResults

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

"========[ GIT Integration ]================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

"========[ Ruby ]================
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'

Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'thoughtbot/vim-rspec'

Plug 'henrik/vim-ruby-runner'

"========[ PHP ]================
Plug 'stanangeloff/php.vim'
Plug 'lumiliet/vim-twig'
Plug 'adoy/vim-php-refactoring-toolbox'

"========[ CSS ]================
Plug 'ap/vim-css-color'

"========[ CoffeeScript ]================
Plug 'kchmck/vim-coffee-script'

"========[ TypeScript ]================
Plug 'leafgarland/typescript-vim'

call plug#end()


"====[ Custom Hotkeys ]======================================
nmap <Leader>pi :so %<CR>:PlugInstall<CR>:PlugClean!<CR>
nmap <Leader>pu :so %<CR>:PlugUpdate<CR>
nnoremap <F9> :!%:p<Enter>

"====[ Basic coding style ]================
set tabstop=2
set shiftwidth=2
set expandtab " Never ever use tabs

au FileType php setl sw=4 sts=4 et " Stick to symfony's 4 spaces format

set cindent

"====[ Search settings ]================
set smartcase
set hlsearch
set incsearch
set ignorecase
set showmatch

"====[ Cursor line ]==============================================================
set startofline
set cursorline

"====[ Syntax highlightning ]=====================================================
syntax enable
set t_Co=256

set nu     " No line number
set nocp   " No compatibility mode

au BufNewFile,BufRead /tmp/sql* set filetype=sql

"====[ Color schema ]=====================================================
colorscheme jellybeans

"====[ Windows config ]=====================================================
"========[ Font ]===========================================================
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
"let g:airline_powerline_fonts = 1
"set guifont=Bitstream\ Vera\ Sans\ Mono:h12
"
"========[ Gvim ]===========================================================
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif
