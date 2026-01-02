return {
	"folke/noice.nvim",
	enabled = vim.fn.has("win32") == 0,
	event = "VeryLazy",
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = true,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
	},
	keys = {
		{ "<leader>nd", "<Cmd>NoiceDismiss<CR>", desc = "Noice dismiss" }
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}
