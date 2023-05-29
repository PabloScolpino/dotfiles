local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>a', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
