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
      'VonHeikemen/lsp-zero.nvim',
      'hrsh7th/cmp-buffer',
      'SirVer/ultisnips',
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = function()
          -- optional call to setup (see customization section)
          require("cmp_nvim_ultisnips").setup {}
        end,
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
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

            -- For `mini.snippets` users:
            -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
            -- insert({ body = args.body }) -- Insert at cursor
            -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
            -- require("cmp.config").set_onetime({ sources = {} })
          end,
        },
        -- snippet = {
        --   expand = function(args)
        --     vim.snippet.expand(args.body)
        --   end,
        -- },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<C-y>'] = cmp.mapping.confirm({ select = true }),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
        }),
        formatting = require("lsp-zero").cmp_format({ details = true }),
        sources = cmp.config.sources({
          { name = 'copilot' },
          { name = 'nvim_lsp' },  -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          { name = 'ultisnips' }, -- For ultisnips users.
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
          'ruby_lsp',
          'ts_ls',
          'yamlls',
        },
        automatic_installation = true,
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end,
        }
      })
    end
  }
}
