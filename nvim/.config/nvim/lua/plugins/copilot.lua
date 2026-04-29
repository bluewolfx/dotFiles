return {
	{
		"zbirenbaum/copilot.lua",
		enabled = vim.fn.has("win32") == 0,
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
			},
			panel = {
				enabled = false,
			},
			filetypes = {
				["*"] = true,
				["yaml"] = false,
				["markdown"] = false,
				["help"] = false,
				["gitcommit"] = false,
				["gitrebase"] = false,
			},
			keymap = { accept = "<M-;>" },

		},
	},
}
