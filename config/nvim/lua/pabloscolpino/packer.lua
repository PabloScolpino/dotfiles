vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  ------------------------------------------------------------------------------
  --[ Packer can manage itself ]------------------------------------------------
  use('wbthomason/packer.nvim')


  ------------------------------------------------------------------------------
  --[ Buffer management ]-------------------------------------------------------
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use('toppair/reach.nvim')


  ------------------------------------------------------------------------------
  --[ Code parsing and introspection ]------------------------------------------
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  -- use 'nvim-treesitter/playground'


  ------------------------------------------------------------------------------
  --[ LSP ]---------------------------------------------------------------------
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        'williamboman/mason.nvim', -- Optional
        run = function() pcall(vim.cmd, 'MasonUpdate') end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'L3MON4D3/LuaSnip' },                  -- Required
      { 'SirVer/ultisnips' },
      { 'quangnguyen30192/cmp-nvim-ultisnips' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/nvim-cmp' },     -- Required
      {
        'tzachar/cmp-tabnine',
        run = './install.sh',
        requires = 'hrsh7th/nvim-cmp'
      },
    }
  })

  use('towolf/vim-helm')

  -- use({
  --   'zbirenbaum/copilot-cmp',
  --   requires = { 'zbirenbaum/copilot.lua' },
  --   after = { 'copilot.lua' },
  -- })
  ------------------------------------------------------------------------------
  --[ Code assistant ]----------------------------------------------------------
  use({
    "yetone/avante.nvim",
    requires = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "hrsh7th/nvim-cmp",
    }
  })
  --{
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
  --   opts = {
  --     -- add any opts here
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  --   -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     --- The below dependencies are optional,
  --     "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
  --     "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
  --     "zbirenbaum/copilot.lua", -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- }

  ------------------------------------------------------------------------------
  --[ Code manipulation ]-------------------------------------------------------
  use('bronson/vim-trailing-whitespace') -- Highlight trailing whitespaces
  use('chochkov/vim-rspec-focus')
  use('echasnovski/mini.comment')
  use('godlygeek/tabular')
  use('lukas-reineke/indent-blankline.nvim')
  -- use('stevearc/conform.nvim')
  use('tpope/vim-abolish')

  ------------------------------------------------------------------------------
  --[ Git ]---------------------------------------------------------------------
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  use('f-person/git-blame.nvim')
  use('ahmedkhalf/project.nvim') --Project management


  ------------------------------------------------------------------------------
  --[ Code execution ]----------------------------------------------------------
  ----[ Testing ]---------------------------------------------------------------
  use({
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'olimorris/neotest-rspec',
    },
  })

  use({
    'nvim-lua/plenary.nvim',
    requires = {
      'andythigpen/nvim-coverage'
    }
  })

  ----[ Competitive programming ]-----------------------------------------------
  use({
    'xeluxee/competitest.nvim',
    requires = { 'MunifTanjim/nui.nvim' }
  })


  ------------------------------------------------------------------------------
  --[ Interface behavior ]------------------------------------------------------
  use('mbbill/undotree') -- Undo history
  use({
    'nvim-orgmode/orgmode',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  })
  -- use({
  --   'nvim-orgmode/orgmode',
  --   config = function()
  --     require('orgmode').setup({})
  --   end
  -- })
  use('akinsho/org-bullets.nvim')
  -- use({
  --   'akinsho/org-bullets.nvim',
  --   config = function()
  --     require('org-bullets').setup()
  --   end
  -- })

  ----[ Containers ]------------------------------------------------------------
  use({
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  })


  ----[ Code folding ]----------------------------------------------------------
  -- use({
  --   'kevinhwang91/nvim-ufo',
  --   requires = {
  --     'kevinhwang91/promise-async',
  --     'ryanoasis/vim-devicons'
  --   }
  -- })

  ----[ Markdown preview ]------------------------------------------------------
  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
  })


  ------------------------------------------------------------------------------
  --[ Interface appearence ]----------------------------------------------------

  ----[ Bufferline ]---------------------------------------------------------------
  use({ 'akinsho/bufferline.nvim', tag = '*', requires = 'nvim-tree/nvim-web-devicons' })

  ----[ Airline ]---------------------------------------------------------------
  use({ 'bling/vim-airline', requires = { 'vim-airline/vim-airline-themes' } })

  ----[ Colors ]----------------------------------------------------------------
  use({
    'metalelf0/jellybeans-nvim',
    as = 'jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' },
  })
  use('liuchengxu/space-vim-dark')
  use('tomasiser/vim-code-dark')
  use('rebelot/kanagawa.nvim')
end)
