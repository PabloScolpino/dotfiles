function ApplyColorScheme(color)
	color = color or 'codedark'

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "black" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
end

ApplyColorScheme()
