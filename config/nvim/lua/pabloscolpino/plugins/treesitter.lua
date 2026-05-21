local parsers = {
  'c', 'lua', 'vim', 'vimdoc', 'query',
  'ruby', 'javascript', 'typescript', 'yaml', 'python',
}

local filetypes = {
  'c', 'lua', 'vim', 'help', 'query',
  'ruby', 'eruby', 'javascript', 'typescript', 'yaml', 'python',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(parsers)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = filetypes,
      callback = function()
        pcall(vim.treesitter.start)
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.wo.foldlevel = 99
        -- indentexpr left to nvim's built-in indent/<ft>.vim files; nvim-treesitter
        -- main branch indent queries are still rough (ruby in particular dedents on `.`)
      end,
    })
  end,
}
