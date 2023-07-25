local lsp_zero = require('lsp-zero')
lsp_zero.preset('recommended')

------------------------------------------------------------------
-- Servers installed
lsp_zero.ensure_installed({
  'clangd',
  'dockerls',
  'eslint',
  'lua_ls',
  -- 'solargraph',
  'tsserver',
  'yamlls',
})

------------------------------------------------------------------
-- Key Bindings
lsp_zero.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<C-/>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format() end, opts)
end)

lsp_zero.setup({})

local lspconfig = require('lspconfig')
------------------------------------------------------------------
-- Run solargraph inside the project's container whenever possible
-- TODO: detect project structure and generate different commands
--   * normal docker compose
--   * monorepo type docker compose
--   * run solargraph bare-metal
-- local root_pattern = lspconfig.util.root_pattern('.git')
-- print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')
-- print(root_pattern)
-- print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')
-- lua local lspconfig = require('lspconfig'); local bufname = vim.api.nvim_buf_get_name(0); local filename = lspconfig.util.path.is_absolute(bufname) and bufname or lspconfig.util.path.join(vim.loop.cwd(), bufname); print(filename)
--
-- local function solargraph_normal_docker_compose()
--   return { 'docker', 'compose', 'run', '--rm', 'web', 'bundle', 'exec', 'solargraph', 'stdio' }
-- end
--
-- local function solargraph_command_monorepo()
--   local bufname = vim.api.nvim_buf_get_name(0) -- The name of the current buffer
--
--   local filename = lspconfig.util.path.is_absolute(bufname) and bufname or
--       lspconfig.util.path.join(vim.loop.cwd(), bufname) -- Turned into a filename
--
--   local project_dirname = root_pattern(filename) or
--       lspconfig.util.path.dirname(filename) -- Then the directory of the project
--   return {
--     'docker',
--     'compose',
--     'run',
--     '--rm',
--     'gem-builder',
--     'bash',
--     '-c',
--     '\"cd pbr && asdf install && gem install solargraph && bundle exec solargraph stdio\"'
--   }
-- end
--
-- local function solargraph_command()
--   return solargraph_normal_docker_compose()
-- end

lspconfig.solargraph.setup({
  -- cmd = solargraph_command()
  cmd = { 'bundle', 'exec', 'solargraph', 'stdio' }
})

------------------------------------------------------------------
-- fix lsp-lua for neovim config files
-- lspconfig.lua_ls.setup({
--   diagnostics = { globals = { "vim" } }
-- })

------------------------------------------------------------------
-- Completion sources
local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  mapping = {
    -- Configure the desired key mappings for completion navigation
    -- ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    -- ['<C-e>'] = cmp.mapping.close(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'ultisnips' },
    { name = 'buffer' },
  },
})

vim.g.UltiSnipsSnippetDirectories = { '~/.UltiSnips' }
