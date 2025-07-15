-- Neovim Configuration File
require('config.lazy')
require('config.keymap')

-- General settings
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- telescope configuration
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree' })
vim.keymap.set('n', '<leader>fc', '<cmd>Telescope projects<cr>', { desc = 'Projects' })


vim.opt.showmode = false

-- colortheme configuration
vim.cmd.colorscheme("nightfly")
