return {
	"folke/snacks.nvim",
	opts = {
		picker = {
			win = { input = { keys = { ["<Esc>"] = { "close", mode = { "n", "i" } } } } },
			sources = {
				files = {
					hidden = false,
					cmd = (function()
						local os = vim.loop.os_uname().sysname
						if os == "Windows_NT" then
							return "cmd /c dir /s /b"
						elseif os ~= "Darwin" then
							if vim.fn.executable("fd") == 1 then return "fd --type f" end
							if vim.fn.executable("rg") == 1 then return "rg --files" end
						end
						return nil
					end)(),
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
