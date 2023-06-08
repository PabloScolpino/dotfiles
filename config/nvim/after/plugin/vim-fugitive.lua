vim.keymap.set("n", "<Leader>s", ":G<CR><C-w>15-", { desc = 'Show git status' })
vim.keymap.set("n", "<Leader>gd", vim.cmd.Gvdiffsplit, { desc = 'Show git diff of current buffer' })
vim.keymap.set("n", "<Leader>gc", ":G commit<CR>", { desc = 'Start git commit' })
