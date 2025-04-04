----[ make vim yank put data into clipboard ]---------------------------------
vim.opt.clipboard = "unnamed"

-----[ Set up smarter search behavior ]--------------------------------------
vim.opt.incsearch = true  -- Look-ahead as search pattern is specified
vim.opt.ignorecase = true -- Ignore case in all searches...
vim.opt.smartcase = true  -- ...unless uppercase letters used
vim.opt.hlsearch = true   -- Highlight all matches

-----[ Make tabs, trailing whitespace, and non-breaking spaces visible ]------
vim.opt.list = true

-----[ Basic coding style ]---------------------------------------------------
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true -- Never ever use tabs
--vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-----[ Cursor line ]----------------------------------------------------------
vim.opt.startofline = true
vim.opt.cursorline = true

-----[ Line Numbers ]---------------------------------------------------------
vim.opt.number = true

-----[ Additional files]------------------------------------------------------
vim.opt.swapfile = false
vim.opt.backup = false

vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
})
