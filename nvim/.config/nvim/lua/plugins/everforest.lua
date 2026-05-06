return {
	{
		"sainnhe/everforest",
		lazy = true,
		priority = 2000,
		init = function()
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_dim_inactive_windows = 0
		end,
		config = function()
			-- Darken background beyond the built-in "hard" preset
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "everforest",
				callback = function()
					local bg = "#1a2024"
					vim.api.nvim_set_hl(0, "Normal",      { bg = bg, fg = "#d3c6aa" })
					vim.api.nvim_set_hl(0, "NormalNC",    { bg = bg })
					vim.api.nvim_set_hl(0, "SignColumn",  { bg = bg })
					vim.api.nvim_set_hl(0, "LineNr",      { bg = bg })
					vim.api.nvim_set_hl(0, "FoldColumn",  { bg = bg })
					vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = bg })
					-- Make Go constants stand out from regular variables
					vim.api.nvim_set_hl(0, "@constant",          { fg = "#dbbc7f" })
					vim.api.nvim_set_hl(0, "@constant.go",       { fg = "#dbbc7f" })
					vim.api.nvim_set_hl(0, "@variable.go",       { fg = "#d3c6aa" })
					vim.api.nvim_set_hl(0, "@variable.member.go",{ fg = "#a7c080" })
				end,
			})
		end,
	},
}
