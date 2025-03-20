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
-- vim.keymap.set("n", "<Leader>c", ':set number<CR>:GitGutterSignsEnable<CR>', { desc = "Prepare buffer for mouose copy" })
-- vim.keymap.set("n", "<Leader>C", ':set norelativenumber<CR>:set nonumber<CR>:GitGutterDisable<CR>',
--   { desc = "Prepare buffer for mouose copy" })
vim.keymap.set("n", "<Leader>c", function()
  vim.wo.number = true
  vim.cmd("GitGutterEnable")
end, { desc = "Enable line numbers and GitGutter signs" })


vim.keymap.set("n", "<Leader>C", function()
  vim.wo.relativenumber = false
  vim.wo.signcolumn = 'no'
  vim.wo.number = false
  vim.cmd("GitGutterDisable")
end, { desc = "Disable GitGutter and line numbers" })


vim.keymap.set("n", "<Leader>p", vim.cmd.bprevious, { desc = "jump to previous buffer" })
vim.keymap.set("n", "<Leader>n", vim.cmd.bnext, { desc = "jump to next buffer" })

vim.keymap.set("n", "<F9>", ":!%:p<Enter>", { desc = "Execute current file" })

vim.keymap.set("n", "<BS><BS>", vim.cmd.FixWhitespace)
