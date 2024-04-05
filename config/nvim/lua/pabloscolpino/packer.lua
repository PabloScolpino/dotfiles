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
    branch = 'v2.x',
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

  use({
    'zbirenbaum/copilot-cmp',
    requires = { 'zbirenbaum/copilot.lua' },
    after = { 'copilot.lua' },
  })

  ------------------------------------------------------------------------------
  --[ Code manipulation ]-------------------------------------------------------
  use('bronson/vim-trailing-whitespace') -- Highlight trailing whitespaces
  use('chochkov/vim-rspec-focus')
  use('echasnovski/mini.comment')
  use('godlygeek/tabular')
  use('lukas-reineke/indent-blankline.nvim')
  use('tpope/vim-abolish')

  use({
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
  })


  ------------------------------------------------------------------------------
  --[ Git ]---------------------------------------------------------------------
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  -- use('f-person/git-blame.nvim')
  use('ahmedkhalf/project.nvim') --Project management


  ------------------------------------------------------------------------------
  --[ GitHub ]------------------------------------------------------------------
  use({
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  })


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
  ----[ Syntax Highlighting ]---------------------------------------------------
  use('towolf/vim-helm')

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
