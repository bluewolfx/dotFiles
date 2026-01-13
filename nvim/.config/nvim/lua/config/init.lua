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

-- Clipboard configuration for SSH/remote sessions (Linux only)
if vim.fn.has("unix") == 1 and vim.fn.has("mac") == 0 then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

-- colortheme configuration
vim.cmd.colorscheme("nightfly")

-- use ripgrep for :grep
vim.opt.grepprg = "rg --vimgrep --smart-case --hidden --glob '!.git/'"
vim.opt.grepformat = "%f:%l:%c:%m"
