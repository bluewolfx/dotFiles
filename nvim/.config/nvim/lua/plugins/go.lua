return {
	"ray-x/go.nvim",
	enabled = vim.fn.has("win32") == 0,
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		'mfussenegger/nvim-dap',
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'theHamsta/nvim-dap-virtual-text',
	},
	config = function()
		require("go").setup()
		vim.lsp.config.gopls = {
			settings = {
				gopls = {
					analyses = {
						unusedparams = true,
						shadow = true,
						nilness = true,
						unusedwrite = true,
						useany = true,
						unreachable = true,
					},
					hints = {
						assignVariableTyoes = true,
						functionTypeParameters = true,
					},
					staticcheck = true,
				},
			},
		}
		vim.lsp.enable('gopls')
		require("go").setup()
	end,
	event = { "CmdlineEnter" },
	keys = { ... },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()'
}
