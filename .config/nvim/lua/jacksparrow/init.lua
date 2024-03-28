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

