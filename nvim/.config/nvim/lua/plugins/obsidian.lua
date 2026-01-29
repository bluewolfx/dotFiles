return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian-repo/Banon",
			},
			{
				name = "work",
				path = "~/obsidian-repo/1Global",
			},
		},
		ui = {
			enable = false,
		},
		legacy_commands = false,
	},
}
