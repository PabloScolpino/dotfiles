return {
  {
    'williamboman/mason.nvim',
    lazy = false,
    opts = {},
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup({
            -- panel = {
            --   enabled = true,
            -- },
            -- suggestion = {
            --   auto_trigger = true,
            --   hide_during_completion = true,
            --   keymap = {
            --     accept = '<C-yy>',
            --   },
            -- },
          })
        end,
      },
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'onsails/lspkind.nvim' },
      'hrsh7th/cmp-buffer',
      {
        'garymjr/nvim-snippets',
        opts = {
          friendly_snippets = true,
          search_paths = { vim.fn.stdpath('config') .. '/snippets' },
        },
      }
      -- {
      --   'codota/tabnine-nvim',
      --   build = "./dl_binaries.sh"
      -- },
      -- {
      --   'tzachar/cmp-tabnine',
      --   build = './install.sh',
      --   dependencies = 'hrsh7th/nvim-cmp',
      --   config = function()
      --     require('cmp_tabnine.config'):setup({
      --       max_lines = 1000,
      --       max_num_results = 20,
      --       sort = true,
      --       run_on_every_keystroke = true,
      --       snippet_placeholder = '..',
      --       ignored_file_types = {},
      --       show_prediction_strength = true
      --     })
      --   end
      -- }
    },

    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if vim.snippet.active({ direction = 1 }) then
              vim.snippet.jump(1)
            elseif cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if vim.snippet.active({ direction = -1 }) then
              vim.snippet.jump(-1)
            elseif cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        formatting = {
          format = require('lspkind').cmp_format()
        },
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = 'nvim_lsp' },  -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          { name = 'snippets' },
          -- { name = 'snippy' }, -- For snippy users.
          { name = 'buffer' }, })
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    init = function()
      -- Reserve a space in the gutter
      -- This will avoid an annoying layout shift in the screen
      vim.opt.signcolumn = 'yes'
    end,
    config = function()
      local lsp_defaults = require('lspconfig').util.default_config

      -- Add cmp_nvim_lsp capabilities settings to lspconfig
      -- This should be executed before you configure any language server
      lsp_defaults.capabilities = vim.tbl_deep_extend(
        'force',
        lsp_defaults.capabilities,
        require('cmp_nvim_lsp').default_capabilities()
      )

      -- LspAttach is where you enable features that only work
      -- if there is a language server active in the file
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({ 'n', 'x' }, '<C-f>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
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
        },
        automatic_enable = {
          exclude = { 'ruby_lsp', 'solargraph' }
        },
      })

      -- Helper function to detect Ruby version from mise
      local function get_ruby_version()
        local result = vim.fn.system('mise current ruby 2>/dev/null')
        local version = result:match('(%d+%.%d+)')
        return version and tonumber(version) or nil
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
        callback = function()
          local version = get_ruby_version()
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
