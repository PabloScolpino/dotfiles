return {
  {
    'tpope/vim-fugitive',
    cmd = {"Git", "Gdiff", "Gvdiff", "Gstatus", "Gcommit"},
    keys = {
      { "<leader>s", ":Git<CR>", desc = 'Show git status'  },
      { "<leader>gd", ":Gdiff<CR>", desc = 'Show git diff of current buffer' },
      { "<leader>gc", ":Git commit<CR>", desc = 'Start git commit' }
    }
  },
  {
    'airblade/vim-gitgutter' ,
    keys = {
      { "<Leader>gh", ":GitGutterLineHighlightsToggle<CR>", desc = "" },
      { "<Leader>gj", ":GitGutterFold<CR>", desc = "" },
    }
  },
  { 'f-person/git-blame.nvim' },
}
