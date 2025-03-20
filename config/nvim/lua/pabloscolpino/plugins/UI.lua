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
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      require("bufferline").setup{
        options = {
          mode = "buffers",
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          separator_style = "thin",
          always_show_bufferline = true,
          position = "top",
        }
      }
    end
  },
  -- {
  --   'metalelf0/jellybeans-nvim',
  --   as = 'jellybeans-nvim',
  --   dependencies = { 'rktjmp/lush.nvim' },
  -- },
  {
    'tomasiser/vim-code-dark',
    config = function()
      -- Optional: set background type if needed
      vim.o.background = "dark"

      -- Load the colorscheme
      vim.cmd('colorscheme codedark')

      -- Use an autocommand to override highlight groups after the colorscheme is loaded
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
          -- Uncomment and adjust below if you want to change other highlight groups
          -- vim.api.nvim_set_hl(0, "Comment", { fg = "grey", bg = "NONE" })
        end,
      })

      -- Immediately override once at startup
      vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
    end,
  },
  {
    'toppair/reach.nvim',
    keys = {
      { '<C-j>', function() require("reach").switch_to_buffer(1, options) end },
      { '<C-k>', function() require("reach").switch_to_buffer(2, options) end },
      { '<C-l>', function() require("reach").switch_to_buffer(3, options) end },
      { '<C-;>', function() require("reach").switch_to_buffer(4, options) end },
    }
  }
}
