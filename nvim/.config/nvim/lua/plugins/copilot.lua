return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = {
				auto_trigger = true,
			},
			panel = {
				enabled = true,
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
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim",        branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                  -- Only on MacOS or Linux
		cmd = {
			"CopilotChat",
			"CopilotChatOpen",
			"CopilotChatClose",
			"CopilotChatToggle",
			"CopilotChatLoad",
			"CopilotChatModels",
			"CopilotChatAgents",
			"CopilotChatExplain",
			"CopilotChatReview",
			"CopilotChatFix",
			"CopilotChatOptimize",
			"CopilotChatDocs",
			"CopilotChatTests",
			"CopilotChatCommit",
		},
		opts = {
			highlight_headers = false,
			separator = '---',
			error_header = '> [!ERROR] Error',
			model = 'gpt-4.1',
		},

		keys = function()
			return {
				{
					"<leader>ccp",
					function()
						local chat = require("CopilotChat")
						chat.select_prompt()
					end,
					desc = "Copilot Chat Actions",
					mode = { "n", "v" },
				},
				{
					"<leader>ccc",
					":CopilotChat<CR>",
					desc = "Copilot Chat",
					mode = { "n", "v" },
				}
			}
		end,
	},
}
