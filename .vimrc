"====[ Embrace the future ]===================================================
set nocompatible

"====[ Define a more agreeable <Leader> ]=====================================
let mapleader = ","

"====[ Supress warning message in vim 7.4+ ]==================================
set encoding=utf-8

"====[ make vim yank put data into cropboard ]================================
set clipboard=unnamed

"====[ Swap : and ; to make colon commands easier to type ]===================
nnoremap  ;  :
nnoremap  :  ;

"====[ Swap v and CTRL-V, because Block mode is more useful that Visual ]=====
nnoremap    v   <C-V>
nnoremap <C-V>     v

vnoremap    v   <C-V>
vnoremap <C-V>     v

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

"====[ Custom Hotkeys ]=======================================================
nnoremap <Leader>p :so %<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><q>
nnoremap <silent> <Leader>s :so %<CR>

nnoremap <F9> :!%:p<Enter>

"====[ Basic coding style ]===================================================
set tabstop=2
set shiftwidth=2
set expandtab " Never ever use tabs
set cindent

au FileType php setl sw=4 sts=4 et " Stick to symfony's 4 spaces format

"====[ Cursor line ]==========================================================
set startofline
set cursorline
hi cursorline   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" nnoremap <Leader>c :set cursorline! cursorcolumn!<CR> " I don't use this

"====[ Syntax highlightning ]=================================================
syntax enable
set t_Co=256

set number relativenumber
noremap <silent> <Leader>n :set number relativenumber<CR>
noremap <silent> <Leader>N :set norelativenumber<CR>:set nonumber<CR>

au BufNewFile,BufRead /tmp/sql* set filetype=sql

"====[ Email Reading ]========================================================
au BufRead /tmp/*mutt-* set tw=72
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

"====[ Windows config ]=======================================================
"========[ Font ]=============================================================
set guifont=RobotoMono\ Nerd\ Font:14

"========[ Gvim ]=============================================================
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif



"=============================================================================
"====[ Plugins configuration ]================================================
filetype plugin on
call plug#begin('~/.vim/plugged')

"========[ Project management ]===============================================
Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'

"========[ interface improvements ]===========================================
Plug 'christoomey/vim-tmux-navigator'

Plug 'mhinz/vim-startify'
set viminfo='100,n$HOME/.vim/files/info/viminfo

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
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

"========[ File browser ]=====================================================
"============[ NerdTree ]=====================================================
" Plug 'scrooloose/nerdtree'
" noremap <silent> <Leader>t :NERDTreeToggle<CR>
" let NERDTreeMapActivateNode='v'
" let NERDTreeMapOpenInTab='<ENTER>' " gt to switch between tabs

" Plug 'jistr/vim-nerdtree-tabs'
" let g:nerdtree_tabs_open_on_new_tab = 1
" let g:nerdtree_tabs_open_on_console_startup = 2
" let g:nerdtree_tabs_focus_on_files = 0

" Plug 'xuyuanp/nerdtree-git-plugin'
"============[ VIFM ]=========================================================
Plug 'vifm/vifm.vim'

"========[ VIM Buffer handling ]==============================================
" Go to the vim instance that already has the file open + other stuff
Plug 'vitorgalvao/autoswap_mac'
set title titlestring=

"========[ System interaction ]===============================================
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'

"========[ Text manipulation ]================================================
Plug 'bronson/vim-trailing-whitespace'       " Highlight trailing whitespaces
Plug 'zirrostig/vim-schlepp'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " gcc
Plug 'tpope/vim-abolish'    " crs fooBar -> foo_bar, MixedCase (crm),
                            " camelCase (crc), snake_case (crs), UPPER_CASE (cru),
                            " dash-case (cr-), dot.case (cr.), space case (cr<space>)
Plug 'tpope/vim-jdaddy'     " gqaj
Plug 'godlygeek/tabular'    " <range> :Tab/:  OR <range> :Tab/=> OR <range> :Tab/<regex>
noremap <silent> <Leader>t=> :Tab /=><CR>
noremap <silent> <Leader>tr :'a,'s Tab /=><CR>

"========[ Code Snippets ]====================================================
if has('python') || has('python3')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Trigger configuration. Do not use <tab> if you use YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
  let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.UltiSnips', $HOME.'/.vim/UltiSnips']
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
endif

Plug 'majutsushi/tagbar'

if v:version > 740 && (has('python') || has('python3'))
  "Plug 'Valloric/YouCompleteMe'
  "let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  "let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" Plug 'shawncplus/phpcomplete.vim'
  " Plug 'zxqfl/tabnine-vim'
  Plug 'codota/tabnine-vim'
endif

"========[ Preview & visualization ]=========================================
Plug 'kannokanno/previm'
"let g:previm_open_cmd = 'open -a Safari'
Plug 'tyru/open-browser.vim'

Plug 'FuDesign2008/mermaidViewer.vim'
autocmd BufNewFile,BufReadPost *.mmd,*.mermaid set filetype=mermaid

Plug 'junegunn/limelight.vim'
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" noremap <silent> <Leader>l :Limelight<CR>
" noremap <silent> <Leader>L :Limelight!<CR>

"========[ Syntax hightlight and code hints ]=================================
Plug 'scrooloose/syntastic'
let g:syntastic_ruby_checkers          = ['rubocop', 'mri']

" prerequisites for syntastic jsx
" npm install -g jsxhint
" npm install standard
let g:syntastic_javascript_checkers = ['jsxhint', 'standard']
let g:syntastic_javascript_standard_generic = 1

" Solargraph client
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

"========[ Searching ]========================================================
Plug 'gabesoft/vim-ags'
nnoremap <silent> <Leader>ag  :Ags<CR>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>f :FZF<CR>

"========[ GIT Integration ]==================================================
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
noremap <silent> <Leader>g :GV!<CR>

"========[ DB Integration ]===================================================
Plug 'tpope/vim-dadbod'

"========[ Ruby ]=============================================================
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'

Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'thoughtbot/vim-rspec'

Plug 'henrik/vim-ruby-runner'

"========[ PHP ]==============================================================
Plug 'stanangeloff/php.vim'
Plug 'lumiliet/vim-twig'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'qbbr/vim-symfony'
Plug 'stephpy/vim-php-cs-fixer'
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

"========[ CSS ]==============================================================
Plug 'ap/vim-css-color'

"========[ CoffeeScript ]=====================================================
Plug 'kchmck/vim-coffee-script'

"========[ TypeScript ]=======================================================
Plug 'leafgarland/typescript-vim'

"========[ Elixir ]===========================================================
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

"========[ TOML ]=============================================================
Plug 'cespare/vim-toml'

call plug#end()
"====[ Plugins configuration End ]============================================
"=============================================================================

"====[ Color schema ]=========================================================
let g:jellybeans_overrides = {'background': { 'ctermbg': 'none', '256ctermbg': 'none' }}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
colorscheme jellybeans

"====[ Include extra configurations ]=========================================
for f in split(glob('~/.vim/extra/*.vim'), '\n')
  exe 'source' f
endfor

"====[ Mouse interaction in Alacritty ]=======================================
set ttymouse=sgr
