if vim.fn.has("win32") == 1 then
	vim.env.PATH = vim.env.PATH .. ";C:\\ProgramData\\chocolatey\\bin"
end

require('config.lazy')
require('config.keymap')

-- General settings
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers


vim.opt.scrolloff = 24

vim.opt.showmode = false

-- colortheme configuration
vim.cmd.colorscheme("nightfly")
