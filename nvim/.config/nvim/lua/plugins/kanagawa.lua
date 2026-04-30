return {
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 2000,
		config = function()
			require('kanagawa').setup({
				colors = {
					palette = {
						-- Warm up Wave's cool blue-black backgrounds to Dragon's near-black
						sumiInk0 = "#080808",
						sumiInk1 = "#0D0C0C",
						sumiInk2 = "#141212",
						sumiInk3 = "#1A1818",
						sumiInk4 = "#3D3939",
					},
				},
				overrides = function(colors)
					local theme = colors.theme
					local palette = colors.palette
					return {
						SnacksDashboardHeader   = { fg = palette.crystalBlue, bold = true },
						SnacksDashboardTitle    = { fg = palette.oniViolet, bold = true },
						SnacksDashboardDesc     = { fg = theme.ui.fg_dim },
						SnacksDashboardIcon     = { fg = palette.springBlue },
						SnacksDashboardKey      = { fg = palette.carpYellow, bold = true },
						SnacksDashboardFooter   = { fg = palette.fujiGray, italic = true },
						SnacksDashboardDir      = { fg = palette.waveAqua2 },
						SnacksDashboardFile     = { fg = theme.ui.fg },
						SnacksDashboardSpecial  = { fg = palette.surimiOrange },
					}
				end,
			})
			vim.cmd.colorscheme('kanagawa-wave')
		end,
	},
}
