-----[ Define a more agreeable <Leader> ]-------------------------------------
vim.g.mapleader = ","

-----[ Swap : and ; to make colon commands easier to type ]-------------------
vim.keymap.set("n", ";", ":")
vim.keymap.set("n", ":", ";")

-----[ Swap v and CTRL-V, because Block mode is more useful that Visual ]-----
vim.keymap.set("n", "v", "<C-V>")
vim.keymap.set("n", "<C-V>", "v")

vim.keymap.set("v", "v", "<C-V>")
vim.keymap.set("v", "<C-V>", "v")

