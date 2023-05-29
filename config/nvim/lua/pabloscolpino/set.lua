----[ make vim yank put data into cropboard ]--------------------------------
vim.opt.clipboard = "unnamed"

-----[ Set up smarter search behaviour ]--------------------------------------
vim.opt.incsearch = true       -- Lookahead as search pattern is specified
vim.opt.ignorecase = true      -- Ignore case in all searches...
vim.opt.smartcase = true       -- ...unless uppercase letters used
vim.opt.hlsearch = true        -- Highlight all matches

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true       -- Never ever use tabs
vim.opt.cindent = true
