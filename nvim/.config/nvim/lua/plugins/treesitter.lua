return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		opts = {
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
			auto_install = true,
		},
		config = function(_, opts)
			require("nvim-treesitter").setup(opts)
			-- The new nvim-treesitter main branch no longer auto-attaches highlights.
			-- Use neovim's built-in treesitter API to attach on every FileType event.
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(ev)
					pcall(vim.treesitter.start, ev.buf)
				end,
			})
		end,
	},
}
