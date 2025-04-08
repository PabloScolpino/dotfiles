return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'powerline_dark',
    }
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
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000, -- Ensure it loads first
    opts = {
      transparent = true,
    },
    config = function(_, opts)
      local theme = require('vscode')
      theme.setup(opts)
      theme.load()
    end,
  },
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'deep',
      transparent = true
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true
    },
  },
  { "rebelot/kanagawa.nvim" },
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
    opts = {
      modes = {
        on_the_side = {
          mode = "diagnostics",
          win = {
            type = "split",
            position = 'left',
          },
          filter = { buf = 0 }, -- filter diagnostics to the current buffer
          focus = true,
        },
      }
    }, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble on_the_side toggle<cr>",              desc = "Diagnostics (Trouble)", },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)", },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>",      desc = "Symbols (Trouble)", },
      -- { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>",                  desc = "Location List (Trouble)", },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>",                   desc = "Quickfix List (Trouble)", },
    },
  }
}
