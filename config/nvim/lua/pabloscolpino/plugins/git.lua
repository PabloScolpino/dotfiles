return {
  {
    'tpope/vim-fugitive',
    cmd = { "Git", "Gdiff", "Gvdiff", "Gstatus", "Gcommit" },
    lazy = false,
    keys = {
      { "<leader>s",  "<Cmd>Git<CR>",        desc = 'Show git status' },
      { "<leader>gd", "<Cmd>Gdiff<CR>",      desc = 'Show git diff of current buffer' },
      { "<leader>gc", "<Cmd>Git commit<CR>", desc = 'Start git commit' }
    }
  },
  {
    'airblade/vim-gitgutter',
    lazy = false,
    keys = {
      { "<Leader>gh", "<Cmd>GitGutterLineHighlightsToggle<CR>", desc = "Toggle git diff line highlight" },
      { "<Leader>gj", "<Cmd>GitGutterFold<CR>",                 desc = "Fold git diff block" },
    }
  },
  { 'f-person/git-blame.nvim' },
}
