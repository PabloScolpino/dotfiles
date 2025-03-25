local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  {
    'bronson/vim-trailing-whitespace'
  },
  {
    'chochkov/vim-rspec-focus'
    -- vim.keymap.set('n', '<Leader>rf', ":AddFocusTag<CR>", { desc = "Add rspec focus tag" })
    -- vim.keymap.set('n', '<Leader>ru', ":RemoveAllFocusTags<CR>", { desc = "Remove all focus tags in file" })
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
}
