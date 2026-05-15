return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			width = 60,
			pane_gap = 1,
			preset = {
				keys = {
					{
						icon = " ",
						key = "f",
						desc = "Find File",
						action = function()
							Snacks.picker.files({ hidden = true })
						end
					},
					{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
					{
						icon = " ",
						key = "g",
						desc = "Find Text",
						action = function()
							Snacks.picker.grep({ hidden = true })
						end
					},
					{
						icon = " ",
						key = "r",
						desc = "Recent Files",
						action = function()
							Snacks.picker.recent()
						end
					},
					{
						icon = " ",
						key = "c",
						desc = "Config",
						action = function()
							Snacks.picker.files({ cwd = vim.fn.stdpath("config"), hidden = true })
						end
					},
					{ icon = " ", key = "s", desc = "Restore Session", section = "session" },
					{ icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
			},
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
		},
		indent = {
			animate = { enabled = false },
		},
		lazygit = { enabled = true },
		gitbrowser = { enabled = true },
		input = { enabled = true },
		notifier = { enabled = true },
		picker = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		toggle = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{ "<leader>gg",  function() Snacks.lazygit() end,                                       desc = "Lazygit" },
		{ "<leader>pf",  function() Snacks.picker.files({ hidden = true, ignored = true }) end,  desc = "Snacks.Picker project files" },
		{ "<leader>ff",  function() Snacks.picker.git_files() end,                               desc = "Snacks.Picker git files" },
		{ "<leader>fg",  function() Snacks.picker.grep() end,                                   desc = "Snacks.Picker live grep" },
		{ "<leader>fh",  function() Snacks.picker.help() end,                                   desc = "Snacks.Picker search help" },
		{ "<leader>fb",  function() Snacks.picker.buffers() end,                                desc = "Snacks.Picker search buffers" },
		{ "<leader>fdd", function() Snacks.picker.diagnostics({ bufnr = 0 }) end,               desc = "Snacks.Picker search document diagnostics" },
		{ "<leader>fds", function() Snacks.picker.lsp_symbols() end,                            desc = "Snacks.Picker search document symbols" },
		{ "<leader>fwd", function() Snacks.picker.diagnostics() end,                            desc = "Snacks.Picker search workspace diagnostics" },
		{ "<leader>fws", function() Snacks.picker.lsp_workspace_symbols() end,                  desc = "Snacks.Picker search workspace symbols" },
		{ "<leader>en",  function() Snacks.picker.files { cwd = vim.fn.stdpath("config") } end, desc = "Snacks.Picker nvim config files" },
	}
}
