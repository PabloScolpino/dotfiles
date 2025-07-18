return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
    config = function()
      require("mcphub").setup({
        extensions = {
          avante = {
            make_slash_commands = true, -- make /slash commands from MCP server prompts
          }
        },
        -- log = {
        --   level = vim.log.levels.DEBUG,
        --   to_file = true,
        --   file_path = vim.fn.expand("~/mcphub.log"),
        -- }
      })
    end
  }

}
