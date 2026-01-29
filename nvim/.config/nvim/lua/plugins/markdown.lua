return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		config = function()
			-- Check if parsers are installed before enabling
			local has_parser = pcall(vim.treesitter.language.get_lang, 'markdown')
			if not has_parser then
				vim.notify("Markdown parser not installed. Run :TSInstall markdown markdown_inline", vim.log.levels.WARN)
				return
			end
			
			require('render-markdown').setup({
				enabled = true,
				render_modes = { 'n', 'c', 't' },
			})
		end,
	},
	{
		"bullets-vim/bullets.vim",
		ft = { "markdown" },
	},
}
