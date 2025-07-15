return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			icons_enabled = true,
		},
		sections = {
			lualine_a = {
				{
					"filename",
					path = 1,
				},
				function()
					return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
				end,
			},
		},
	}
}
