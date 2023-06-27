--[ Define a more agreeable <Leader> ]-------------------------------------
vim.g.mapleader = ","

-----[ Swap : and ; to make colon commands easier to type ]-------------------
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

--[ Swap v and CTRL-V, because Block mode is more useful that Visual ]-----
vim.keymap.set("n", "v", "<C-V>")
vim.keymap.set("n", "v", "<C-V>")
vim.keymap.set("n", "<C-V>", "v")
vim.keymap.set("n", "<C-V>", "v")

vim.keymap.set("v", "v", "<C-V>")
vim.keymap.set("v", "<C-V>", "v")

--[ Line Numbers ]---------------------------------------------------------
--noremap <silent> <Leader>N :set relativenumber!<CR>
--noremap <silent> <Leader>c :set number<CR>:GitGutterSignsEnable<CR>
--noremap <silent> <Leader>C :set norelativenumber<CR>:set nonumber<CR>:GitGutterSignsDisable<CR>:SyntasticToggleMode<CR>

vim.keymap.set("n", "<Leader>p", vim.cmd.bprevious, { desc = "jump to previous buffer" })
vim.keymap.set("n", "<Leader>n", vim.cmd.bnext, { desc = "jump to next buffer" })

vim.keymap.set("n", "<F9>", ":!%:p<Enter>", { desc = "Execute current file" })
