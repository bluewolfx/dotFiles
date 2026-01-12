return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	opts = function()
		local themes = require("telescope.themes")
		local actions = require("telescope.actions")
		local defaults = {
			file_ignore_patterns = {"^.git/", "node_modules", ".cache"},
			hidden = true,
			mappings = {
				i = {
					["œ"] = actions.send_selected_to_qflist + actions.open_qflist,
				},

			},
		}
		if vim.fn.has("win32") == 1 then
			defaults.preview = { treesitter = false }
		end
		-- Prefer fd; fallback to ripgrep if fd is not available
		local find_cmd
		if vim.fn.executable("fd") == 1 then
			find_cmd = { "fd", "--type", "f", "--strip-cwd-prefix" }
		elseif vim.fn.executable("rg") == 1 then
			find_cmd = { "rg", "--files" }
		end
		if find_cmd then
			defaults.find_command = find_cmd
		end

		return {
			defaults = defaults,
			extensions = {
				["ui-select"] = {
					themes.get_dropdown {}
				}
			}
		}
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		{ 'nvim-telescope/telescope-ui-select.nvim' },
		{ 'zschreur/telescope-jj.nvim' },
	},
	keys = function()
		local telescope = require("telescope.builtin")

		local vcs_picker = function(opts)
			local jj_pick_status, jj_res = pcall(require("telescope").extensions.jj.files, opts)
			if jj_pick_status then
				return
			end

			local git_files_status, git_res = pcall(telescope.git_files, opts)
			if not git_files_status then
				error("Could not launch jj/git files: \n" .. jj_res .. "\n" .. git_res)
			end
		end

		return {
			{ "<leader>pf", function() telescope.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true }) end, desc = "Telescope project files" },
			{ "<leader>fd", function() telescope.diagnostics() end,                                                            desc = "Telescope diagnostics" },
			{ "<leader>fk", function() telescope.keymaps() end,                                                                desc = "Telescope keymaps" },
			{ "<leader>fc", function() telescope.commands() end,                                                               desc = "Telescope commands" },
			{ "<leader>fr", function() telescope.oldfiles() end,                                                               desc = "Telescope recent files" },
			{ "<leader>fb", function() telescope.buffers() end,                                                                desc = "Telescope buffers" },
			{ "<leader>ff", vcs_picker,                                                                                        desc = "Telescope git files" },
			{ "<leader>fg", function() telescope.live_grep() end,                                                              desc = "Telescope live grep" },
			{ "<leader>fh", function() telescope.help_tags() end,                                                              desc = "Telescope search help" },
			{ "<leader>en", function() telescope.find_files { cwd = vim.fn.stdpath("config") } end,                            desc = "Telescope nvim config files" },
			{ "<leader>er", function() telescope.find_files { cwd = vim.env.HOME .. "/Repos", find_command = { "ls" } } end,   desc = "Telescope repos" },
			{ "<leader>tc", function() telescope.command_history() end,                                                        desc = "Telescope command history" },
			{ "<leader>td", "<cmd>Telescope diagnostics<cr>",                                                                  desc = "Workspace diagnostics (Telescope)" },
			{ "<leader>xd", vim.diagnostic.setqflist,                                                                          desc = "Open diagnostics list" },

		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		pcall(telescope.load_extension, 'fzf')
		telescope.load_extension("ui-select")
		telescope.load_extension("jj")
	end,
}
