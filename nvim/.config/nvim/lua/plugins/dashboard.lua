return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
			sources = {
				files = {
					hidden = false,
					cmd = vim.loop.os_uname().sysname ~= "Linux" and "fd --type f --strip-cwd-prefix" or nil,
				},
			},
		},
		dashboard = {
			width = 60,
			pane_gap = 1,
			sections = {
				{ section = "header" },
				{ section = "keys", gap = 1, padding = 1 },
				{ pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
				{ pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "Git Status",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git status --short --branch --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 3,
				},
				{ section = "startup" },
			},
		}

	},
	-- Optional: if you want it to load on startup
	lazy = false,
	priority = 1000, -- High priority to load
}
