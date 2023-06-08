require('competitest').setup({
  run_command = {
    c = { exec = "./$(FNOEXT)" },
    cpp = { exec = "./$(FNOEXT)" },
    rust = { exec = "./$(FNOEXT)" },
    ruby = { exec = "ruby ./$(FNOEXT)" },
    python = { exec = "python", args = { "$(FNAME)" } },
    java = { exec = "java", args = { "$(FNOEXT)" } },
  },
})

vim.keymap.set("n", "<Leader>cr", function() pcall(vim.cmd, 'CompetiTestRun') end, { desc = 'Run competitest cases' })
vim.keymap.set("n", "<Leader>ca", function() pcall(vim.cmd, 'CompetiTestAdd') end, { desc = 'Add competitest test case' })
