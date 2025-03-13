return {
  'nvim-telescope/telescope.nvim',
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>f",   "<cmd>Telescope git_files<cr>",    desc = "Search filename in git project" },
    { "<leader>ag",  "<cmd>Telescope grep_string<cr>",  desc = "Search for string under cursor" },
    { "<leader>af",  "<cmd>Telescope live_grep<cr>",    desc = "Live search for input string in content" },
    { "<leader>/",   "<cmd>Telescope find_files<cr>",   desc = "Search for filename from CWD downwards" },
    { "<leader>vo",  "<cmd>Telescope vim_options<cr>",  desc = "List vim options" },
    { "<leader>vk",  "<cmd>Telescope keymaps<cr>",      desc = "List vim keymaps" },

    { "<leader>gl",  "<cmd>Telescope git_commits<cr>",  desc = "Show git history with diffs" },
    { "<leader>gs",  "<cmd>Telescope git_stash<cr>",    desc = "Show git stash" },
    { "<leader>gbl", "<cmd>Telescope git_bcommits<cr>", desc = "Show git history with diffs for current buffer" },
    { "<leader>bb",  "<cmd>Telescope buffers<cr>",      desc = "Show open buffers" },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          prompt_position = "bottom",
          preview_width = 0.75,
          results_width = 0.25,
        },
        vertical = {
          mirror = false,
        },
        width = 0.99,
        height = 0.89,
        preview_cutoff = 120,
      },
    },
  },
}
