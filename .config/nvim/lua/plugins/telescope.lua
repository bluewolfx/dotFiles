return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.8',
	dependencies = { 'nvim-lua/plenary.nvim', 'rcarriga/nvim-notify' },
	config = function()
		require('telescope').setup {
			defaults = {
				-- other default configurations
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
				},
			},
		}
		require("telescope").load_extension("notify")
	end,
}
