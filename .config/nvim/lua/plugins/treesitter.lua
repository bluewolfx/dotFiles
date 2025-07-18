return {
	"nvim-treesitter/nvim-treesitter",
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	opts = {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}
}
