vim.keymap.set("n", "<Leader>u", vim.cmd.UndotreeToggle)

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
