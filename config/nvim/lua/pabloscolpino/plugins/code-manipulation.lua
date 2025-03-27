local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  {
    'bronson/vim-trailing-whitespace'
  },
  {
    'chochkov/vim-rspec-focus',
    config = function()
      vim.keymap.set('n', '<Leader>rf', "<Cmd>AddFocusTag<CR>", { desc = "Add rspec focus tag" })
      vim.keymap.set('n', '<Leader>ru', "<Cmd>RemoveAllFocusTags<CR>", { desc = "Remove all focus tags in file" })
    end,
  },
  {
    'echasnovski/mini.comment'
  },
  {
    'godlygeek/tabular'
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = { highlight = highlight, char = "" },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    },
  },
  -- {'stevearc/conform.nvim'},
  { 'tpope/vim-abolish' },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = false,
    config = function()
      require("refactoring").setup({})
      vim.keymap.set({ "n", "v" }, "<leader>re", "<Cmd>Refactor extract<CR>")
      vim.keymap.set("x", "<leader>rf", "<Cmd>Refactor extract_to_file<CR>")

      vim.keymap.set("x", "<leader>rv", "<Cmd>Refactor extract_var<CR>")

      vim.keymap.set({ "n", "x" }, "<leader>ri", "<Cmd>Refactor inline_var<CR>")

      vim.keymap.set("n", "<leader>rI", "<Cmd>Refactor inline_func<CR>")

      vim.keymap.set("n", "<leader>rb", "<Cmd>Refactor extract_block<CR>")
      vim.keymap.set("n", "<leader>rbf", "<Cmd>Refactor extract_block_to_file<CR>")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  }
}
