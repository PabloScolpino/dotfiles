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
" TODO: define user command Refreshplug and
nnoremap <Leader>r :so %<CR>:PlugClean!<CR>:PlugInstall<CR>:PlugUpdate<CR><q>

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

Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'nanotech/jellybeans.vim'

Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
nmap <C-i> <leader>ig

"============[ Airline ]======================================================
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
"============[ Airline ]======================================================

"============[ GUNDO ]========================================================
Plug 'sjl/gundo.vim'
let g:gundo_prefer_python3 = 1
nnoremap <F5> :GundoToggle<CR>
"============[ GUNDO ]========================================================

"========[ Searching ]========================================================
Plug 'gabesoft/vim-ags'
nnoremap <silent> <Leader>ag  :Ags<CR>

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

"========[ VIM Buffer handling ]==============================================
" Go to the vim instance that already has the file open + other stuff
Plug 'vitorgalvao/autoswap_mac'
set title titlestring=
nnoremap <silent> <Leader>p :bprevious<CR>
nnoremap <silent> <Leader>n :bnext<CR>

"========[ System interaction ]===============================================
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'roxma/vim-paste-easy'

"========[ Text manipulation ]================================================
Plug 'bronson/vim-trailing-whitespace'       " Highlight trailing whitespaces
Plug 'zirrostig/vim-schlepp'

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-jdaddy'     " gqaj
Plug 'godlygeek/tabular'    " <range> :Tab/:  OR <range> :Tab/=> OR <range> :Tab/<regex>
noremap <silent> <Leader>te :'a,'s Tab /=<CR>
noremap <silent> <Leader>tr :'a,'s Tab /=><CR>

"========[ Code manipulation ]================================================
"============[ General ]======================================================
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " gcc
Plug 'tpope/vim-abolish'    " crs fooBar -> foo_bar, MixedCase (crm),
                            " camelCase (crc), snake_case (crs), UPPER_CASE (cru),
                            " dash-case (cr-), dot.case (cr.), space case (cr<space>)
"============[ Autocompletion ]===============================================
if v:version > 740 && (has('python') || has('python3'))
  Plug 'ervandew/supertab'
  Plug 'codota/tabnine-vim'

  " make YCM/tabnine compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
  let g:SuperTabDefaultCompletionType = '<C-n>'
endif

"============[ Snippets ]=====================================================
if has('python') || has('python3')
  Plug 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger       = '<tab>'
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
  let g:UltiSnipsSnippetDirectories=[$HOME.'/.UltiSnips', $HOME.'/.vim/UltiSnips']
  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
endif

"============[ Documentation ]================================================
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

"============[ Validation & lining ]==========================================
"================[ Syntastic ]================================================
Plug 'vim-syntastic/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5

let g:syntastic_ruby_checkers          = ['rubocop', 'reek', 'mri']

" let g:syntastic_debug=3
" sudo npm install -g n
" sudo n install
" sudo npm install -g yarn
" yarn install

let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
let g:syntastic_javascript_checkers = ['eslint']
"================[ Syntastic ]================================================

"================[ CoC ]======================================================
" https://github.com/neoclide/coc.nvim
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" TextEdit might fail if hidden is not set.
" set hidden

" Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300

" Don't pass messages to |ins-completion-menu|.
" set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" set signcolumn=yes
" inoremap <silent><expr> <TAB>
      " \ pumvisible() ? "\<C-n>" :
      " \ <SID>check_back_space() ? "\<TAB>" :
      " \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"================[ LSP ]======================================================
" Solargraph client
"Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" if executable('solargraph')
    " gem install solargraph
    " au User lsp_setup call lsp#register_server({
        " \ 'name': 'solargraph',
        " \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        " \ 'initialization_options': {"diagnostics": "true"},
        " \ 'whitelist': ['ruby'],
        " \ })
" endif
"
" Plug 'autozimu/LanguageClient-neovim', {
    " \ 'branch': 'next',
    " \ 'do': 'bash install.sh',
    " \ }
" Required for operations modifying multiple buffers like rename.
" set hidden

" let g:LanguageClient_serverCommands = { 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'] }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"========[ Preview & visualization ]==========================================
Plug 'kannokanno/previm'
Plug 'tyru/open-browser.vim'

Plug 'FuDesign2008/mermaidViewer.vim'
autocmd BufNewFile,BufReadPost *.mmd,*.mermaid set filetype=mermaid

"========[ GIT Integration ]==================================================
Plug 'airblade/vim-gitgutter'
nnoremap ggh :GitGutterLineHighlightsEnable<CR>
nnoremap ggH :GitGutterLineHighlightsDisable<CR>
nnoremap ggf :GitGutterFold<CR>
set updatetime=300

" To enable line hightlight by default
" let g:gitgutter_highlight_lines = 1

Plug 'tpope/vim-fugitive'
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
Plug 'christoomey/vim-conflicted'

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
Plug 'chochkov/vim-rspec-focus'
nnoremap <Leader>rf :AddFocusTag<CR>
nnoremap <Leader>ru :RemoveAllFocusTags<CR>

Plug 'henrik/vim-ruby-runner'

Plug 'airblade/vim-localorie'
nnoremap <silent> <leader>lt :call localorie#translate()<CR>
nnoremap <silent> <leader>le :call localorie#expand_key()<CR>

"========[ PHP ]==============================================================
Plug 'stanangeloff/php.vim'
Plug 'lumiliet/vim-twig'
" NOTE: Commented out because its default mappings collide with my :bnext map
" Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'qbbr/vim-symfony'
" NOTE: Commented out because its default mappings collide with my :bprev map
" Plug 'stephpy/vim-php-cs-fixer'
" autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
" nunmap <silent><Leader>pcd
" nunmap <silent><Leader>pcf

"========[ CSS ]==============================================================
Plug 'ap/vim-css-color'

"========[ CoffeeScript ]=====================================================
Plug 'kchmck/vim-coffee-script'

"========[ TypeScript ]=======================================================
Plug 'leafgarland/typescript-vim'

"========[ Elixir ]===========================================================
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

"========[ Markdown ]=========================================================
" Plug 'plasticboy/vim-markdown'
" let g:vim_markdown_folding_level = 9

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
