return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- add any opts here
    -- for example
    provider = "claude",
    -- provider = "openai",
    -- auto_suggestions_provider = "copilot",
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",  -- your desired model (or use gpt-4o, etc.)
        extra_request_body = {
          timeout = 30000, -- timeout in milliseconds
          temperature = 0, -- adjust if needed
          max_tokens = 4096,
          -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
        }
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        -- model = "claude/claude-3-7-sonnet-20250219",
        model = "claude-3-7-sonnet-20250219",
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 4096,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_approve_tool_permissions = true
    },
    web_search_engine = {
      provider = "kagi", -- tavily, serpapi, searchapi, google or kagi
    }
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    -- NOTE: Enable this if you want to use copilot as a provider
    --       and make sure to diable / remove it from lsp.lua where it is also configured
    -- {
    --   "zbirenbaum/copilot.lua",      -- for providers='copilot'
    --   cmd = "Copilot",
    --   -- build = ":Copilot auth<CR>",
    --   event = "InsertEnter",
    --   config = function()
    --     require("copilot").setup({
    --       panel = {
    --         enabled = false,
    --       },
    --       suggestion = {
    --         auto_trigger = true,
    --         hide_during_completion = false,
    --         keymap = {
    --           accept = '<Tab>',
    --         },
    --       },
    --     })
    --   end,
    -- },
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  keys = {
    { "<leader>at", "<cmd>AvanteToggle<cr>", desc = "Toggle Avante Chat " },
  },
}
