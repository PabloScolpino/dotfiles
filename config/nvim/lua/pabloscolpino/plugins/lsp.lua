return {
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUpdate', 'MasonLog' },
    opts = {},
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'saghen/blink.cmp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'x' }, '<C-f>', function() vim.lsp.buf.format({ async = true }) end, opts)
          vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
        end,
      })

      require('mason-lspconfig').setup({
        ensure_installed = {
          'clangd',
          'dockerls',
          'eslint',
          'helm_ls',
          'lua_ls',
          'pylsp',
          -- 'ruby_lsp',  -- REMOVED: projects provide their own via Gemfile
          'ts_ls',
          'yamlls',
          'herb_ls',
        },
      })

      -- Teach lua_ls about the nvim runtime so editing this config doesn't
      -- raise 'Undefined global vim' diagnostics regardless of which
      -- root_dir lua_ls resolves for the buffer.
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = {
              library = vim.api.nvim_get_runtime_file('', true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      -- Detect Ruby version via mise, cached per project root so we only
      -- fork `mise` once per project per session.
      local ruby_version_cache = {}
      local ruby_root_markers = { 'Gemfile', '.tool-versions', '.mise.toml', '.git' }

      local function ruby_version_for(buf)
        local root = vim.fs.root(buf or 0, ruby_root_markers)
        if not root then return nil end
        local cached = ruby_version_cache[root]
        if cached ~= nil then
          return cached or nil
        end
        local result = vim.fn.system({ 'mise', '--cd', root, 'current', 'ruby' })
        local version = result:match('(%d+%.%d+)')
        local value = version and tonumber(version) or false
        ruby_version_cache[root] = value
        return value or nil
      end

      -- Configure Ruby LSPs with bundle exec (uses project's gems)
      vim.lsp.config('ruby_lsp', {
        cmd = { 'mise', 'exec', '--', 'bundle', 'exec', 'ruby-lsp' },
        filetypes = { 'ruby', 'eruby' },
        root_markers = { 'Gemfile', '.git' },
      })

      vim.lsp.config('solargraph', {
        cmd = { 'mise', 'exec', '--', 'bundle', 'exec', 'solargraph', 'stdio' },
        filetypes = { 'ruby', 'eruby' },
        root_markers = { 'Gemfile', '.git' },
      })

      -- Autocmd to enable correct Ruby LSP based on version
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'ruby', 'eruby' },
        callback = function(args)
          local version = ruby_version_for(args.buf)
          if version == nil then
            return -- No Ruby version detected, no LSP
          end

          if version >= 3.0 then
            vim.lsp.enable('ruby_lsp')
          else
            vim.lsp.enable('solargraph')
          end
        end,
      })
    end
  }
}
