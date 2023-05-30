-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use('wbthomason/packer.nvim')

  use({
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  })


  ------------------------------------------------------------------------------
  -- Code parsing and introspection
  use({
    'nvim-treesitter/nvim-treesitter',
    {
      run = ':TSUpdate'
    }
  })
  -- use 'nvim-treesitter/playground'

--   use({
--     'VonHeikemen/lsp-zero.nvim',
--     branch = 'v2.x',
--     requires = {
--       -- LSP Support
--       {'neovim/nvim-lspconfig'},             -- Required
--       {                                      -- Optional
--       'williamboman/mason.nvim',
--       run = function()
--         pcall(vim.cmd, 'MasonUpdate')
--       end,
--     },
--     {'williamboman/mason-lspconfig.nvim'}, -- Optional
-- 
--     -- Autocompletion
--     {'hrsh7th/nvim-cmp'},     -- Required
--     {'hrsh7th/cmp-nvim-lsp'}, -- Required
--     {'L3MON4D3/LuaSnip'},     -- Required
--   }
-- })

  ------------------------------------------------------------------------------
  -- Code manipulation
  use('echasnovski/mini.comment')
  use('sbdchd/neoformat')

  ------------------------------------------------------------------------------
  -- GIT
  use('tpope/vim-fugitive')
  use('airblade/vim-gitgutter')
  use('f-person/git-blame.nvim')

  ------------------------------------------------------------------------------
  -- Testing
  use({
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
    },
  })

  ------------------------------------------------------------------------------
  -- File management

  ------------------------------------------------------------------------------
  -- Buffer management
  use('ThePrimeagen/harpoon')

  ------------------------------------------------------------------------------
  -- Undo history
  use('mbbill/undotree')

  ------------------------------------------------------------------------------
  -- UI Improvements
  use('lukas-reineke/indent-blankline.nvim')
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  })
  use('ryanoasis/vim-devicons')


  ------------------------------------------------------------------------------
  -- Colors
  use({
    'metalelf0/jellybeans-nvim',
    as = 'jellybeans-nvim',
    requires = { 'rktjmp/lush.nvim' },
  })
  use('liuchengxu/space-vim-dark')
  use('tomasiser/vim-code-dark')
end)
