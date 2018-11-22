"====[ Define a more agreeable <Leader> ]======================================
let mapleader = ","

"====[ Set up smarter search behaviour ]======================================
set incsearch       " Lookahead as search pattern is specified
set ignorecase      " Ignore case in all searches...
set smartcase       " ...unless uppercase letters used
set hlsearch        " Highlight all matches

" highlight the match in red (Damian Conway)
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.2)<cr>

function! HLNext (blinktime)
  highlight WhiteOnRed ctermfg=white ctermbg=red
  let [bufnum, lnum, col, off] = getpos('.')
  let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
  let target_pat = '\c\%#\%('.@/.'\)'
  let ring = matchadd('WhiteOnRed', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

"====[ Make tabs, trailing whitespace, and non-breaking spaces visible ]======
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

nnoremap <silent> <BS><BS> :FixWhitespace<CR>

"====[ Swap : and ; to make colon commands easier to type ]======
nnoremap  ;  :
nnoremap  :  ;

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual mode "]======
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

"====[ Custom Hotkeys ]======================================
nnoremap <Leader>p :so %<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><q>
nnoremap <silent> <Leader>s :so %<CR>

nnoremap <F9> :!%:p<Enter>

"====[ Basic coding style ]================
set tabstop=2
set shiftwidth=2
set expandtab " Never ever use tabs
set cindent

au FileType php setl sw=4 sts=4 et " Stick to symfony's 4 spaces format

"====[ Cursor line ]==============================================================
set startofline
set cursorline
hi cursorline   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

"====[ Syntax highlightning ]=====================================================
syntax enable
set t_Co=256

set nu     " With line number
set nocp   " No compatibility mode

au BufNewFile,BufRead /tmp/sql* set filetype=sql


"====[ Windows config ]=====================================================
"========[ Font ]===========================================================
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
"let g:airline_powerline_fonts = 1
"set guifont=Bitstream\ Vera\ Sans\ Mono:h12

"========[ Gvim ]===========================================================
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif

"=============================================================================
filetype plugin on

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
Plug 'vim-airline/vim-airline-themes'                               " airline - themes
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

"========[ VIM Buffer handling ]============================
" Go to the vim instance that already has the file open + other stuff
Plug 'vitorgalvao/autoswap_mac'
set title titlestring=

"========[ Text handling ]==================================
Plug 'bronson/vim-trailing-whitespace'                      " Highlight trailing whitespaces
Plug 'zirrostig/vim-schlepp'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'

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

" Plug 'Valloric/YouCompleteMe'
" Plug 'shawncplus/phpcomplete.vim'

"========[ Preview & visualization ]=========================
Plug 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Safari'
Plug 'tyru/open-browser.vim'

Plug 'FuDesign2008/mermaidViewer.vim'
autocmd BufNewFile,BufReadPost *.mmd,*.mermaid set filetype=mermaid

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
noremap <silent> <Leader>l :Limelight<CR>
noremap <silent> <Leader>L :Limelight!<CR>

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
nnoremap <silent> <Leader>ag  :Ags<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
nnoremap <silent> <Leader>f :FZF<CR>

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
Plug 'qbbr/vim-symfony'

"========[ CSS ]================
Plug 'ap/vim-css-color'

"========[ CoffeeScript ]================
Plug 'kchmck/vim-coffee-script'

"========[ TypeScript ]================
Plug 'leafgarland/typescript-vim'

call plug#end()

"====[ Color schema ]=====================================================
colorscheme jellybeans
