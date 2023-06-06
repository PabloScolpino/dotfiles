vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  --[ Packer can manage itself ]------------------------------------------------
  use('wbthomason/packer.nvim')

  --[ Code parsing and introspection ]------------------------------------------
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })
  -- use 'nvim-treesitter/playground'

  --[ LSP ]---------------------------------------------------------------------
  use({
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
                                 -- Optional
        'williamboman/mason.nvim',
        run = function() pcall(vim.cmd, 'MasonUpdate') end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },                -- Required
      { 'hrsh7th/cmp-nvim-lsp' },            -- Required
      { 'L3MON4D3/LuaSnip' },                -- Required
    }
  })

  --[ Code manipulation ]-------------------------------------------------------
  use('bronson/vim-trailing-whitespace') -- Highlight trailing whitespaces
  use('echasnovski/mini.comment')
  use('tpope/vim-abolish')

  --[ Markdown preview ]--------------------------------------------------------
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  --[ Git ]---------------------------------------------------------------------
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  -- use('f-person/git-blame.nvim')

  --[ GitHub ]------------------------------------------------------------------
  use({
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  })

  --[ Project management ]------------------------------------------------------
  use({
    "ahmedkhalf/project.nvim",
  })

  --[ Testing ]-----------------------------------------------------------------
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
  })

  --[ Containers ]--------------------------------------------------------------
  use {
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }

  --[ Buffer management ]-------------------------------------------------------
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  })
  use('toppair/reach.nvim')
  -- use('ThePrimeagen/harpoon')

  --[ Undo history ]------------------------------------------------------------
  use('mbbill/undotree')

  --[ Blank lines ]-------------------------------------------------------------
  use('lukas-reineke/indent-blankline.nvim')

  --[ Airline ]-----------------------------------------------------------------
  use({
    'bling/vim-airline',
    requires = { 'vim-airline/vim-airline-themes' }
  })

  --[ Code folding ]------------------------------------------------------------
  use({
    'kevinhwang91/nvim-ufo',
    requires = {
      'kevinhwang91/promise-async',
      'ryanoasis/vim-devicons'
    }
  })

  --[ Colors ]------------------------------------------------------------------
  use({
    'metalelf0/jellybeans-nvim',
    as = 'jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' },
  })
  use('liuchengxu/space-vim-dark')
  use('tomasiser/vim-code-dark')
  use("rebelot/kanagawa.nvim")
end)
