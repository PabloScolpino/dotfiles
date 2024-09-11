function apply_color_scheme(color)
  color = color or 'kanagawa'

  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
  vim.api.nvim_set_hl(0, "Comment", { fg = "grey", bg = "NONE" })
end

apply_color_scheme()
