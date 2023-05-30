local nt = require("neotest")

nt.setup({
  adapters = {
    require("neotest-rspec"),
  }
})


vim.keymap.set("n", "<Leader>ts", function() nt.summary.toggle() end)
vim.keymap.set("n", "<Leader>tr", function() nt.run.run(vim.fn.expand("%")) end)
