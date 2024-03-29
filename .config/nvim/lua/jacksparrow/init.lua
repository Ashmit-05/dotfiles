require("jacksparrow.remap")
vim.cmd("set relativenumber")
vim.cmd("set number")
vim.cmd("set scrolloff=8")

-- Set tabstop and shiftwidth to 2 spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Enable mouse support
vim.opt.mouse = "a"

vim.cmd[[
	nnoremap G Gzz
	nnoremap o zzo
]]

-- Yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y') -- yank motion
vim.keymap.set({'n', 'v'}, '<leader>Y', '"+Y') -- yank line

-- Paste from system clipboard
vim.keymap.set('n', '<leader>p', '"+p')  -- paste after cursor
vim.keymap.set('n', '<leader>P', '"+P')  -- paste before cursor
