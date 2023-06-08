local lsp = require('lsp-zero')
lsp.preset('recommended')

------------------------------------------------------------------
-- Servers installed
lsp.ensure_installed({
  'clangd',
  'dockerls',
  'eslint',
  'lua_ls',
  'solargraph',
  'tsserver',
})

------------------------------------------------------------------
-- Key Bindings
lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<C-/>', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format() end, opts)
end)

lsp.setup()

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
    { name = 'ultisnips' },
    { name = 'buffer' },
  },
})

vim.g.UltiSnipsSnippetDirectories = { '~/.UltiSnips' }
