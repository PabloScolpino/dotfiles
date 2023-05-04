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

"====[ Custom Hotkeys ]=======================================================
" TODO: define user command Refreshplug and
nnoremap <silent> <BS><BS> :FixWhitespace<CR>
nnoremap <F9> :!%:p<Enter>

"====[ Basic coding style ]===================================================
set tabstop=2
set shiftwidth=2
set expandtab " Never ever use tabs
set cindent

"====[ Cursor line ]==========================================================
set startofline
set cursorline
hi cursorline   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"====[ Line Numbers ]=========================================================
set number
noremap <silent> <Leader>N :set relativenumber!<CR>
noremap <silent> <Leader>c :set number<CR>:GitGutterSignsEnable<CR>
noremap <silent> <Leader>C :set norelativenumber<CR>:set nonumber<CR>:GitGutterSignsDisable<CR>:SyntasticToggleMode<CR>

"====[ Syntax highlightning ]=================================================
syntax enable
set t_Co=256
au BufNewFile,BufRead /tmp/sql* set filetype=sql

"====[ Email Reading ]========================================================
au BufRead /tmp/*mutt-* set tw=72
augroup filetypedetect
  " Mail
  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
augroup END

"====[ vimrc handling ]=================================================
nnoremap <Leader>vpr :source $MYVIMRC<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><q>
nnoremap <Leader>ve :e $MYVIMRC<cr>
nnoremap <Leader>vr :source $MYVIMRC<cr>
nnoremap <Leader>vcs :s/[=><]/>/g<CR>
nnoremap <Leader>vce :s/[=><]/</g<CR>
nnoremap <Leader>vcu :s/[=><]/=/g<CR>

">>>>[ Windows config ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"========[ Font ]=============================================================
set guifont=RobotoMono\ Nerd\ Font:14

"========[ Gvim ]=============================================================
" Gvim for windows
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after
endif
"<<<<[ Windows config ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>[ Plugins configuration ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
filetype plugin on

if has('nvim')
  let g:plug_dir = '~/.vim/plugged-nvim'
else
  let g:plug_dir = '~/.vim/plugged'
endif

call plug#begin(g:plug_dir)

"========[ Project management ]===============================================
Plug 'tpope/vim-speeddating' | Plug 'jceb/vim-orgmode'

"========[ Vim Interface ]====================================================
autocmd VimResized * :wincmd =
Plug 'christoomey/vim-tmux-navigator'

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" nmap <C-i> <Leader>ig

">>>>>>>>>>>>[ Airline ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
"<<<<<<<<<<<<[ Airline ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>>>>>[ GUNDO ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1
nnoremap <F5> :GundoToggle<CR>
"<<<<<<<<<<<<[ GUNDO ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"<<<<<<<<[ Vim Interface ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ VIM Buffer handling ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
" Go to the vim instance that already has the file open + other stuff
Plug 'vitorgalvao/autoswap_mac'
set title titlestring=
nnoremap <silent> <Leader>p :bprevious<CR>
nnoremap <silent> <Leader>n :bnext<CR>
"<<<<<<<<[ VIM Buffer handling ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"========[ External integrations ]============================================
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'roxma/vim-paste-easy'

">>>>>>>>>>>>[ Browser integration ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if has('nvim')
  " GhostInstall
  " Plug 'roxma/vim-hug-neovim-rpc'
  " Plug 'roxma/nvim-yarp'
  " Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
  " GhostInstall

  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
  " if g:started_by_firenvim == v:true
  if exists("g:started_by_firenvim")
    set guifont=Monaco:h20
  endif

endif
"<<<<<<<<<<<<[ Browser integration ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>>>>>[ Testing ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'vim-test/vim-test'
function! DockerTransform(cmd) abort
  return 'docker-compose exec web ' . a:cmd
endfunction
let g:test#custom_transformations = {'docker': function('DockerTransform')}
let g:test#transformation = 'docker'

let test#ruby#bundle_exec = 1
let test#ruby#use_binstubs = 0
noremap <silent> <Leader>t :TestFile<CR>

function! DockerComposeRailsCreateTestDatabase()
  :!docker-compose run web bundle exec rake db:drop db:create db:schema:load RAILS_ENV=test
endfunction
nnoremap <F10> :call DockerComposeRailsCreateTestDatabase()<CR>
"<<<<<<<<<<<<[ Testing ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"<<<<<<<<[ External integrations ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ Text manipulation ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'bronson/vim-trailing-whitespace'       " Highlight trailing whitespaces
Plug 'zirrostig/vim-schlepp'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-jdaddy'     " gqaj
Plug 'godlygeek/tabular'    " <range> :Tabularize/:  OR <range> :Tabularize/=> OR <range> :Tabularize/<regex>
" noremap <silent> <Leader>te :'a,'s Tabularize /=<CR>
" noremap <silent> <Leader>tr :'a,'s Tabularize /=><CR>
" noremap <silent> <Leader>tb :'a,'s Tabularize /{<CR>
"<<<<<<<<[ Text manipulation ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ Code manipulation ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"============[ General ]======================================================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " gcc
Plug 'tpope/vim-abolish'    " crs fooBar -> foo_bar, MixedCase (crm),
                            " camelCase (crc), snake_case (crs), UPPER_CASE (cru),
                            " dash-case (cr-), dot.case (cr.), space case (cr<space>)
">>>>>>>>>>>>[ Autocompletion ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if !has('nvim') && v:version > 740 && (has('python') || has('python3'))
  Plug 'github/copilot.vim'
  " Plug 'ervandew/supertab'
  " Plug 'tabnine/YouCompleteMe'

  " " make YCM/tabnine compatible with UltiSnips (using supertab)
  " let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  " let g:SuperTabDefaultCompletionType = '<C-n>'
endif

if has('nvim')
  "Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
  Plug 'github/copilot.vim'
endif
"<<<<<<<<<<<<[ Autocompletion ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>>>>>[ Snippets ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
if has('python') || has('python3')
  Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger       = '<tab>'
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.UltiSnips', $HOME.'/.vim/UltiSnips']
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
endif
"<<<<<<<<<<<<[ Snippets ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"============[ Documentation ]================================================
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

">>>>>>>>>>>>[ Validation & lining ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'prettier/vim-prettier'

">>>>>>>>>>>>>>>>[ Ale ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'dense-analysis/ale'
" let g:ale_change_sign_column_color=1
" let g:ale_set_highlights=1

highlight ALEWarning ctermbg=Red

nnoremap <silent> <Leader>ur  :ALEFix rubocop<CR>
"<<<<<<<<<<<<<<<<[ Ale ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"<<<<<<<<<<<<[ Validation & lining ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ Code manipulation ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

">>>>>>>>[ Preview & visualization ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

Plug 'FuDesign2008/mermaidViewer.vim'
autocmd BufNewFile,BufReadPost *.mmd,*.mermaid set filetype=mermaid
"<<<<<<<<[ Preview & visualization ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ Searching ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'gabesoft/vim-ags'
nnoremap <silent> <Leader>ag  :Ags<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <Leader>gla :Commits<CR>
nnoremap <Leader>gl :BCommits<CR>
"<<<<<<<<[ Searching ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

">>>>>>>>[ GIT Integration ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'airblade/vim-gitgutter'
nnoremap <Leader>gh :GitGutterLineHighlightsToggle<CR>
nnoremap <Leader>gj :GitGutterFold<CR>
set updatetime=300

" To enable line hightlight by default
" let g:gitgutter_highlight_lines = 1

Plug 'tpope/vim-fugitive'
nnoremap <Leader>s :G<CR><C-w>10-
nnoremap <Leader>gd :Gvdiffsplit!<CR>
nnoremap <Leader>gc :G commit<CR>

Plug 'christoomey/vim-conflicted'
let g:diffget_local_map = 'gdl'
let g:diffget_upstream_map = 'gdh'
"<<<<<<<<[ GIT Integration ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"========[ DB Integration ]===================================================
Plug 'tpope/vim-dadbod'

">>>>>>>>[ Language Specific ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
">>>>>>>>>>>>[ Ruby ]>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'

Plug 'slim-template/vim-slim'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'

Plug 'thoughtbot/vim-rspec'
Plug 'chochkov/vim-rspec-focus'
nnoremap <Leader>rf :AddFocusTag<CR>
nnoremap <Leader>ru :RemoveAllFocusTags<CR>

Plug 'henrik/vim-ruby-runner'

Plug 'airblade/vim-localorie'
nnoremap <silent> <Leader>lt :call localorie#translate()<CR>
nnoremap <silent> <Leader>le :call localorie#expand_key()<CR>
"<<<<<<<<<<<<[ Ruby ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

"============[ CSS ]==============================================================
Plug 'ap/vim-css-color'

"============[ TypeScript ]=======================================================
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

"============[ Markdown ]=========================================================
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_level = 3


call plug#end()
"<<<<<<<<[ Language Specific ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
"<<<<[ Plugins configuration ]<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
