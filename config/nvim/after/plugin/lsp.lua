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

lsp_zero.setup()

------------------------------------------------------------------
local lspconfig = require('lspconfig')

local function solargraph_command()
  -- TODO: detect project structure and generate different commands
  --   * normal docker compose
  --   * monorepo type docker compose
  --   * run solargraph bare-metal
  return { 'docker', 'compose', 'run', '--rm', 'web', 'bundle', 'exec', 'solargraph', 'stdio' }
end

lspconfig.solargraph.setup({
  cmd = solargraph_command()
})
------------------------------------------------------------------
-- fix lsp-lua for neovim config files
lspconfig.lua_ls.setup({
  diagnostics = { globals = { "vim" } }
})

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
