return {
	'kristijanhusak/vim-dadbod-ui',
	dependencies = {
		{ 'tpope/vim-dadbod', lazy = true },
	},
	cmd = {
		'DBUI',
		'DBUIToggle',
		'DBUIAddConnection',
		'DBUIFindBuffer',
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		-- Load database connections from external file
		local db_file = vim.fn.expand('~/.config/nvim/db_connections.lua')
		if vim.fn.filereadable(db_file) == 1 then
			dofile(db_file)
		end
	end,
}
