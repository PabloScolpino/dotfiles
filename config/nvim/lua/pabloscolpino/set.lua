----[ make vim yank put data into cropboard ]---------------------------------
vim.opt.clipboard = "unnamed"

-----[ Set up smarter search behaviour ]--------------------------------------
vim.opt.incsearch = true       -- Lookahead as search pattern is specified
vim.opt.ignorecase = true      -- Ignore case in all searches...
vim.opt.smartcase = true       -- ...unless uppercase letters used
vim.opt.hlsearch = true        -- Highlight all matches

-----[ Make tabs, trailing whitespace, and non-breaking spaces visible ]------
vim.opt.list = true

-----[ Basic coding style ]---------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true       -- Never ever use tabs
--vim.opt.cindent = true
vim.opt.smartindent = true

-----[ Cursor line ]----------------------------------------------------------
vim.opt.startofline = true
vim.opt.cursorline = true
--hi cursorline   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
--hi cursorcolumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

-----[ Line Numbers ]---------------------------------------------------------
vim.opt.number = true
