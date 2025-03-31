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
    keys = {
      { '<Leader>rf', "<Cmd>AddFocusTag<CR>",        desc = "Add rspec focus tag" },
      { '<Leader>ru', "<Cmd>RemoveAllFocusTags<CR>", desc = "Remove all focus tags in file" }
    }
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
    keys = {
      { "<leader>re",  "<Cmd>Refactor extract<CR>",               desc = "Extract",               mode = { "n", "v" } },
      { "<leader>rf",  "<Cmd>Refactor extract_to_file<CR>",       desc = "Extract to file",       mode = "x" },
      { "<leader>rv",  "<Cmd>Refactor extract_var<CR>",           desc = "Extract variable",      mode = "x" },
      { "<leader>ri",  "<Cmd>Refactor inline_var<CR>",            desc = "Inline variable",       mode = { "n", "x" } },
      { "<leader>rI",  "<Cmd>Refactor inline_func<CR>",           desc = "Inline function",       mode = "n" },
      { "<leader>rb",  "<Cmd>Refactor extract_block<CR>",         desc = "Extract block",         mode = "n" },
      { "<leader>rbf", "<Cmd>Refactor extract_block_to_file<CR>", desc = "Extract block to file", mode = "n" }
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
}
