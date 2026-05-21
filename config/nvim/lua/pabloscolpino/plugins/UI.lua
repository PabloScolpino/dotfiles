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
    event = 'VimEnter',
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
    },
    keys = {
      { '<C-j>', '<Cmd>BufferLineGoToBuffer 1<CR>', desc = 'Go to buffer 1' },
      { '<C-k>', '<Cmd>BufferLineGoToBuffer 2<CR>', desc = 'Go to buffer 2' },
      { '<C-l>', '<Cmd>BufferLineGoToBuffer 3<CR>', desc = 'Go to buffer 3' },
      { '<C-;>', '<Cmd>BufferLineGoToBuffer 4<CR>', desc = 'Go to buffer 4' },
      { '<C-h>', '<Cmd>BufferLineCyclePrev<CR>',    desc = 'Previous buffer' },
    },
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
    opts = {
      style = "night",
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    opts = {
      transparent = true,
    },
  },
  {
    'navarasu/onedark.nvim',
    opts = {
      style = 'deep',
      transparent = true,
    },
  },
  { "rebelot/kanagawa.nvim" },
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
