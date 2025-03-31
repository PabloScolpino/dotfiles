return {
  {
    'bling/vim-airline',
    dependencies = { 'vim-airline/vim-airline-themes' },
    config = function()
      vim.g.airline_theme = 'jellybeans'
      vim.g.airline_powerline_fonts = 1
      vim.g.airline_extensions_tabline_enabled = 1
      vim.g.airline_extensions_tabline_left_sep = ' '
      vim.g.airline_extensions_tabline_left_alt_sep = '|'
      vim.g.airline_extensions_tabline_fnamemod = ':t'
      vim.opt.laststatus = 2
    end
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
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
    lazy = false,
    opts = {
      actions = {
        split = '-',
        vertsplit = '|',
        tabsplit = ']',
        delete = '<Space>',
      },
    },
    keys = {
      { '<C-j>', function() require("reach").switch_to_buffer(1) end },
      { '<C-k>', function() require("reach").switch_to_buffer(2) end },
      { '<C-l>', function() require("reach").switch_to_buffer(3) end },
      { '<C-;>', function() require("reach").switch_to_buffer(4) end },
      { '<C-h>', function() require("reach").switch_to_buffer(0) end },
    }
  },
  -- Search UI
  -- {
  --   "folke/flash.nvim",
  --   event = "VeryLazy",
  --   ---@type Flash.Config
  --   opts = {},
  --   -- stylua: ignore
  --   keys = {
  --     { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
  --     { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
  --     { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
  --     { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  --     { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  --   },
  -- }
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>",                        desc = "Diagnostics (Trouble)", },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",           desc = "Buffer Diagnostics (Trouble)", },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",                desc = "Symbols (Trouble)", },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                            desc = "Location List (Trouble)", },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                             desc = "Quickfix List (Trouble)", },
    },
  }
}
