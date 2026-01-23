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

vim.keymap.set('t', '<C-\\><C-\\>', '<C-c><C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('t', '<C-\\><C-n>', function()
  local keys = vim.api.nvim_replace_termcodes('<C-c><C-\\><C-n>', true, false, true)
  vim.api.nvim_feedkeys(keys, 'n', false)
  vim.schedule(function()
    local new_width = math.floor(vim.o.columns * 0.7)
    vim.cmd('rightbelow vertical ' .. new_width .. 'new')
  end)
end, { desc = 'New buffer right of terminal (70%)' })
