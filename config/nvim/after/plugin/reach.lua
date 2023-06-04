local reach = require('reach')
reach.setup({
  handle = 'bufnr',              -- 'bufnr' or 'dynamic' or 'auto'
  notifications = true,
})

vim.keymap.set('n', '<C-e>', function() reach.buffers(buffer_options) end, {})
vim.keymap.set('n', '<C-j>', function() reach.switch_to_buffer(1, options) end, {})
vim.keymap.set('n', '<C-k>', function() reach.switch_to_buffer(2, options) end, {})
vim.keymap.set('n', '<C-l>', function() reach.switch_to_buffer(3, options) end, {})
vim.keymap.set('n', '<C-;>', function() reach.switch_to_buffer(4, options) end, {})
