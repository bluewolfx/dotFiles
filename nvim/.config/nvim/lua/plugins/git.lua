return {
	{
		"tpope/vim-fugitive",
		cmd = "Git",
		keys = {
			{ "<leader>gs", vim.cmd.Git, desc = "Git status" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signs_staged_enable = true,
				signcolumn = true,
				numhl = false,
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = 'eol',
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				linehl = true,
				preview_config = {
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
			})
			vim.keymap.set("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Git blame popup" })
			vim.keymap.set("n", "<leader>gB", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle inline blame" })
			vim.keymap.set("n", "<leader>gw", ":Git blame<CR>", { desc = "Git blame window" })
		end,
	},
	{
		"juacker/git-link.nvim",
		lazy = true,
		keys = {
			{
				"<leader>gu",
				function() require("git-link.main").copy_line_url() end,
				desc = "Copy code URL to clipboard",
				mode = { "n", "x" }
			},
			{
				"<leader>go",
				function() require("git-link.main").open_line_url() end,
				desc = "Open code URL in browser",
				mode = { "n", "x" }
			},
		},
	}
}
