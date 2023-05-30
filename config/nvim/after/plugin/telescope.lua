local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>f', builtin.git_files, { desc = 'Search filename in git project' })
vim.keymap.set('n', '<Leader>ag', builtin.grep_string, { desc = 'Search for string under cursor' })
vim.keymap.set('n', '<Leader>af', builtin.live_grep, { desc = 'Live search for input string in content' })
vim.keymap.set('n', '<Leader>/', builtin.find_files, { desc = 'Search for filename from CWD downwards' })

vim.keymap.set('n', '<Leader>vo', builtin.vim_options, {})
vim.keymap.set('n', '<Leader>vk', builtin.keymaps, { desc = 'List vim keymaps' })

vim.keymap.set('n', '<Leader>gl', builtin.git_commits, { desc = 'Show git history with diffs' })
