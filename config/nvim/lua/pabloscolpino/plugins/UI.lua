return {
  {
    'bling/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' }
-- vim.g.airline_theme = 'jellybeans'
-- vim.g.airline_powerline_fonts = 1
-- vim.g.airline_extensions_tabline_enabled = 1
-- vim.g.airline_extensions_tabline_left_sep = ' '
-- vim.g.airline_extensions_tabline_left_alt_sep = '|'
-- vim.g.airline_extensions_tabline_fnamemod = ':t'
-- vim.opt.laststatus=2

  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons'
    -- vim.opt.termguicolors = true
  },
  {
    -- {
    --   'metalelf0/jellybeans-nvim',
    --   as = 'jellybeans-nvim',
    --   dependencies = { 'rktjmp/lush.nvim' },
    -- }
    -- 'liuchengxu/space-vim-dark',
    -- 'tomasiser/vim-code-dark',
    'rebelot/kanagawa.nvim',
    config = function()
      require("kanagawa").setup({})
      vim.cmd.colorscheme "kanagawa"
    end,
  },
  {
    'toppair/reach.nvim',
    keys = {
      { '<C-j>', function() require("reach").switch_to_buffer(1, options ) end},
      { '<C-k>', function() require("reach").switch_to_buffer(2, options ) end},
      { '<C-l>', function() require("reach").switch_to_buffer(3, options ) end},
      { '<C-;>', function() require("reach").switch_to_buffer(4, options ) end},
    }
  }
}

