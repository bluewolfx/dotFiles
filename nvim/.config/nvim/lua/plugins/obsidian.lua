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
				path = "~/obsidian-repo/personal",
			},
			{
				name = "work",
				path = "~/obsidian-repo/professional",
			},
		},
		ui = {
			enable = false,
		},
		legacy_commands = false,
	},
}
