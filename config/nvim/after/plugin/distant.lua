require('distant'):setup({})

-- local distant = require('distant')
-- distant:setup({
--   servers = {
--     ['*'] = {
--       ssh = {
--         identity_files = { '~/.ssh/gitpod' },
--       }
--     }
--   }
-- })

local gitpod_uri = 'user@server'
vim.keymap.set('n', "<Leader>dl", ":DistantLaunch " .. gitpod_uri .. "<CR>", opts)
