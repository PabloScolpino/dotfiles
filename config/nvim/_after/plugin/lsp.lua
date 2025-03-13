local lsp_zero = require('lsp-zero')

-- lsp_zero.preset('recommended')

------------------------------------------------------------------
-- Key Bindings
lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format() end, opts)

  -- vim.keymap.set('n', '<C-h>', function() vim.lsp.buf.hover() end, opts)
  -- vim.keymap.set('n', '<C-/>', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp_zero.setup({})

------------------------------------------------------------------
-- Servers installed
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'clangd',
    'dockerls',
    'eslint',
    'helm_ls',
    'lua_ls',
    -- 'rubocop',
    'ruby_lsp',
    'ts_ls',
    'yamlls',
  },
  automatic_installation = true,
})

local lspconfig = require('lspconfig')

lspconfig.clangd.setup({})
lspconfig.dockerls.setup({})
lspconfig.eslint.setup({})
lspconfig.helm_ls.setup({})
lspconfig.lua_ls.setup({})
lspconfig.rubocop.setup({
  cmd = { "bundle", "exec", "rubocop", "--lsp" },
})
lspconfig.ruby_lsp.setup({})
lspconfig.ts_ls.setup({})
lspconfig.yamlls.setup({
  filetypes = { "yaml", "yml" },
  settings = {
    yaml = {
      format = {
        enable = true,
        formatter = 'yamlfmt',
      },
      validate = true,
    },
  },
  on_attach = function(client, bufnr)
    lsp_zero.async_autoformat(client, bufnr)
  end
})


------------------------------------------------------------------
-- Completion sources
local cmp = require('cmp')
-- local cmp_action = lsp_zero.cmp_action()
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
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    -- { name = 'cmp_tabnine' },
    { name = 'ultisnips' },
    { name = 'buffer',   keyword_length = 3 },
  },
  formatting = lsp_zero.cmp_format({ details = true })
})

vim.g.UltiSnipsSnippetDirectories = { '~/.UltiSnips' }
